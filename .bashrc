# ~/.bashrc
# shellcheck shell=bash
# shellcheck disable=SC2034  # Unused variables

export PATH=~/.local/bin:$PATH

export EDITOR=vim
export PAGER=less-color; export LESS="iFRX"

export DOTFILES_GIT_DIR="$HOME/.dotfiles.git"
alias dotfiles='GIT_DIR="$DOTFILES_GIT_DIR" GIT_WORK_TREE="$HOME"'

export HOMEDIR_GIT_DIR="$HOME/.homedir.git"
alias homedir='GIT_DIR="$HOMEDIR_GIT_DIR" GIT_WORK_TREE="$HOME"'

case $(uname) in
    Linux*)
        alias ls="ls -F --color=auto"
        ;;
    Darwin*)  # Mac +Homebrew
        alias ls="ls -FG"
        BREW_PREFIX=$(brew --prefix)
        export PATH=$BREW_PREFIX/sbin:$BREW_PREFIX/bin:$PATH
        export BASH_COMPLETION_COMPAT_DIR="$BREW_PREFIX/etc/bash_completion.d"
        BASH_COMPLETION_SH="$BREW_PREFIX/etc/profile.d/bash_completion.sh"
        # shellcheck disable=SC1090  # Don't follow external file
        [ -r "$BASH_COMPLETION_SH" ] && source "$BASH_COMPLETION_SH"
        ;;
esac

alias ll="ls -alh"
alias v="vim"
alias d="dotfiles"
alias h="homedir"
alias g="git";          __git_complete g  _git
alias gu="git up";      __git_complete gu _git_pull
alias gs="git status";  __git_complete gs _git_status
alias gd="git diff";    __git_complete gd _git_diff
alias ga="git add";     __git_complete ga _git_add
alias gp="gitleaks -v --repo=. && git push";  __git_complete gp _git_push
alias gsr="git recursive status"
alias ts='tmux attach -t "$TMUX_SESSION_DEFAULT" || tmux new -s "$TMUX_SESSION_DEFAULT"'

alias grep="grep --line-number --color=auto"

### Foreground Colors       Bash Prompt Escaped Colors
C_BLACK=$(tput setaf 0);    P_BLACK="\[$C_BLACK\]"
C_RED=$(tput setaf 1);      P_RED="\[$C_RED\]"
C_GREEN=$(tput setaf 2);    P_GREEN="\[$C_GREEN\]"
C_YELLOW=$(tput setaf 3);   P_YELLOW="\[$C_YELLOW\]"
C_BLUE=$(tput setaf 4);     P_BLUE="\[$C_BLUE\]"
C_MAGENTA=$(tput setaf 5);  P_MAGENTA="\[$C_MAGENTA\]"
C_CYAN=$(tput setaf 6);     P_CYAN="\[$C_CYAN\]"
C_WHITE=$(tput setaf 7);    P_WHITE="\[$C_WHITE\]"
C_HI_BLACK=$(tput setaf 8); P_HI_BLACK="\[$C_HI_BLACK\]"

C_RESET=$(tput sgr0);       P_RESET="\[$C_RESET\]"

C_BOLD=$(tput bold);        P_BOLD="\[$C_BOLD\]"
C_UNDERLINE=$(tput smul);   P_UNDERLINE="\[$C_UNDERLINE\]"
C_REVERSE=$(tput rev);      P_REVERSE="\[$C_REVERSE\]"

### Prompt
GIT_PS1_SHOWUPSTREAM=auto
GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWSTASHSTATE=true
GIT_PS1_SHOWCOLORHINTS=true
GIT_PS1_SHOWUNTRACKEDFILES=true

PROMPT_COMMAND='__git_ps1 "$P_HI_BLACK\u@\h$P_RESET $P_BOLD\w$P_RESET" "$P_HI_BLACK>$P_RESET "'
