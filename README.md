# Anytranslate
Translate words from and to your native language anywhere
> This script is based on [Anycomplete](https://github.com/nathancahill/Anycomplete)

### Usage

Start with the hotkey `⌃⌥⌘T`. Once you start typing, translations will be displayed once a valid word is entered.
They can be choosen with `⌘1-9` or by pressing the arrow keys and Enter.
Pressing `⌘C` copies the selected item to the clipboard.

The hotkey can be changed by passing in arguments to
`registerDefaultBindings` call (in your `~/.hammerspoon/init.lua` file)
such as:

    anycomplete.registerDefaultBindings({"cmd", "ctrl"}, 'L')


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

Translate key: https://tech.yandex.com/translate/
Dictionary key: https://tech.yandex.com/dictionary/
