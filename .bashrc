# ~/.bashrc
# shellcheck shell=bash
# shellcheck disable=SC2034  # Unused variables
# shellcheck disable=SC2153  # Possible misspelling
# shellcheck disable=SC1090  # Don't follow non-constant source

# Bash Completion
for prefix in /usr $(command -v brew > /dev/null && brew --prefix) ; do
    bash_completion_sh="$prefix/share/bash-completion/bash_completion"
    [ -r "$bash_completion_sh" ] && source "$bash_completion_sh" && break
done

# Git Prompt
for git_prompt_sh in /usr/share/git/git-prompt.sh /usr/lib/git-core/git-sh-prompt ; do
    [ -r "$git_prompt_sh" ] && source "$git_prompt_sh" && break
done

# FZF Key-Bindings
for prefix in \
    /usr/share/doc/fzf \
    /usr/share/doc/fzf/examples \
    /usr/local/share/fzf/bash \
    $(command -v brew > /dev/null && brew --prefix)/opt/fzf/shell
do
    fzf_key_bindings_bash="$prefix/key-bindings.bash"
    [ -r "$fzf_key_bindings_bash" ] && source "$fzf_key_bindings_bash" && break
done

# Color Constants
colors_file="$HOME/.local/share/colors.sh"
[ -f "$colors_file" ] && source "$colors_file"

### Foreground Bash Prompt Escaped Colors
P_GREEN="\[$C_GREEN\]"
P_HI_BLACK="\[$C_HI_BLACK\]"
P_RESET="\[$C_RESET\]"

### Prompt
GIT_PS1_SHOWCOLORHINTS=true
GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWSTASHSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=true
GIT_PS1_SHOWUPSTREAM=auto

PROMPT_COMMAND='__git_ps1 "$P_HI_BLACK\u@\h$P_RESET $P_GREEN\w$P_RESET" "$P_HI_BLACK>$P_RESET "'

[ -f "$ENV" ] && source "$ENV"  # ~/.shrc

[ -f ~/.bashrc.local ] && source ~/.bashrc.local
