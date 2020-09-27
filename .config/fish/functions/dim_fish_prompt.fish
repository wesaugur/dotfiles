# ~/.config/fish/functions/dim_fish_prompt.fish
# vi: filetype=bash

function dim_fish_prompt --description 'Hack to dim default prompt separator characters'
    set --universal __fish_git_prompt_color_suffix brblack
    funcsave fish_prompt
    printf '%s\n' '%s/\(set -l normal (set_color\) normal)$/\1 brblack)  # dim_fish_prompt/' x | \
        ex -s "$HOME/.config/fish/functions/fish_prompt.fish"
end
