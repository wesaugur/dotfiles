# ~/.config/fish/functions/abbr_alias.fish
# vi: filetype=bash

function abbr_alias --description 'Create alias and abbr for max compatibility'
    alias $argv
    abbr --global (string split --max=1 '=' $argv)
end
