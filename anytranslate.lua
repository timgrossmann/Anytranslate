-- Anytranslate
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "T", function()
        
    -- Basic api URL's
    local DETECT = "https://translate.yandex.net/api/v1.5/tr.json/detect?"
    local DICT = "https://dictionary.yandex.net/api/v1/dicservice.json/lookup?"
        
    -- Insert your keys here
    local TRANS_KEY = "<YOUR KEY>"
    local DICT_KEY = "<YOUR KEY>"
        
    -- Define the language you want to use
    local NATIVE_LANG = "de"
    local INTO_LANG = "en"
    local LANG_HINTS = "de,en"
    
    local current = hs.application.frontmostApplication()
    local chooser = hs.chooser.new(function(choosen)
        current:activate()  
        hs.eventtap.keyStrokes(choosen.text)
    end)

    chooser:queryChangedCallback(function(string)
        if (string.len(string) < 1) then return end
                
        -- make sure e.g. ä ö ü work
        local query = hs.http.encodeForQuery(string) 
        local trans_query = DETECT .. "key=" .. TRANS_KEY .. "&text=" .. query .. "&hint=" .. LANG_HINTS
                
        -- detect language of input
        hs.http.asyncGet(trans_query, nil, function(code, body)
            if code ~= 200 then return end

            local query_lang = hs.json.decode(body)["lang"]
            local translate_lang = INTO_LANG
            local dest_lang = NATIVE_LANG

            if query_lang == NATIVE_LANG then
                translate_lang = NATIVE_LANG
                dest_lang = INTO_LANG
            else
                translate_lang = query_lang
                dest_lang = NATIVE_LANG
            end

            local from_to = translate_lang .. "-" .. dest_lang
            local query_string = DICT .. "key=" .. DICT_KEY .. "&lang=" .. from_to .. "&text=" .. query

            -- get dictionary entries
            hs.http.asyncGet(query_string, nil, function(status, data)
                if not data then return end

                local ok, results = pcall(function() return hs.json.decode(data) end)
                if not ok then return end
                if not results["def"] or not next(results["def"]) then return end
                                
                local result_arr = {}
                table.insert(result_arr, results["def"][1]["tr"][1]["text"])

                if results["def"][1]["tr"][1]["syn"] then
                    for i in pairs(results["def"][1]["tr"][1]["syn"]) do
                        table.insert(result_arr, results["def"][1]["tr"][1]["syn"][i]["text"])
                    end
                end
                
                -- insert the found words into the 
                choices = hs.fnutils.imap(result_arr, function(result)
                    return {
                        ["text"] = result,
                    }
                end)

                chooser:choices(choices)
            end)

        end)
    end)

    chooser:searchSubText(false)
    chooser:show()
end)
