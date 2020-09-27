# ~/.config/fish/config.fish
# vi: filetype=bash

set fish_greeting                                # Disable greeting
set fish_prompt_pwd_dir_length -1                # Disable short $PWD in prompt
set fish_color_user brblack                      # Dim color username in prompt
set fish_color_host brblack                      # Dim color hostname in prompt

set __fish_git_prompt_showcolorhints             # Enable colored git prompt
set __fish_git_prompt_show_informative_status    # Enable informative git prompt
set __fish_git_prompt_char_stateseparator ' '    # Informative git prompt separator
set __fish_git_prompt_char_cleanstate     '='    # Informative git prompt clean char
set __fish_git_prompt_color_cleanstate brblack   # Informative git prompt clean color
# set __fish_git_prompt_showdirtystate           # Enable git prompt: *,+
# set __fish_git_prompt_showstashstate           # Enable git prompt: $
# set __fish_git_prompt_showuntrackedfiles       # Enable git prompt: %
# set __fish_git_prompt_showupstream auto        # Enable git prompt: =,<,>,<>

[ -f ~/.profile ] && source ~/.profile

status is-interactive && [ -f "$ENV" ] && source "$ENV"  # ~/.shrc

type -q fzf_key_bindings && fzf_key_bindings     # Enable fzf
set --append FZF_CTRL_T_COMMAND '. $dir'         # Anchor fzf Ctrl-T to path prefix
set --append FZF_ALT_C_COMMAND  '. $dir'         # Anchor fzf  Alt-C to path prefix

[ -f ~/.config/fish/config.fish.local ] && source ~/.config/fish/config.fish.local
