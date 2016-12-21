# Anytranslate
Translate words from and to your native language anywhere
> This script is based on [Anycomplete](https://github.com/nathancahill/Anycomplete)

### Setup
Enter your keys and languages into the script file. Defaults are "de"(german) to en("english")
> You can get the translation api key here: https://tech.yandex.com/translate/  
> And the dictionary api key here: https://tech.yandex.com/dictionary/  

> Just register for free and click "Get a free API key."


```lua
local TRANS_KEY = <YOUR KEY>
local DICT_KEY = <YOUR KEY>
        
local NATIVE_LANG = <YOUR NATIVE LANGUAGE>
local INTO_LANG = <DEFAULT LANGUAGE>  --In what language to you want to tranlaste the text if you enter your native language
local LANG_HINTS = "[de,en]" --Prefer some languages (will be prefered if detection is not surea)
```
### Usage
Start with the hotkey `⌃⌥⌘T`. Once you start typing, translations will be displayed once a valid word is entered.
They can be choosen with `⌘1-9` or by pressing the arrow keys and Enter.

If you want to change the hotkey just replace the "T" on the second line of the script with your favored key
```lua
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "T", function()
```

#### Supported languages: 
> en, es, de, fr, it, pl, ru, tr, uk  

> Supported translations:
  - ru-ru
  - ru-en
  - ru-pl
  - ru-uk
  - ru-de
  - ru-fr
  - ru-es
  - ru-it
  - ru-tr
  - en-ru
  - en-en
  - en-de
  - en-fr
  - en-es
  - en-it
  - en-tr
  - pl-ru
  - uk-ru
  - de-ru
  - de-en
  - fr-ru
  - fr-en
  - es-ru
  - es-en
  - it-ru
  - it-en
  - tr-ru
  - tr-en
