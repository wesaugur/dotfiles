# ~/.bashrc

export PATH=~/local/bin:$PATH

export EDITOR=vim
export PAGER=less
export LESS="-RFX"

export DOTFILES_GIT_DIR="$HOME/.dotfiles.git"
alias dotfiles='GIT_DIR="$DOTFILES_GIT_DIR" GIT_WORK_TREE="$HOME"'

export HOMEDIR_GIT_DIR="$HOME/.homedir.git"
alias homedir='GIT_DIR="$HOMEDIR_GIT_DIR" GIT_WORK_TREE="$HOME"'

alias t="tmux"
alias v="vim"
alias g="git"
alias d="dotfiles"
alias h="homedir"
alias ll="ls -alh"
alias gu="git up"
alias gs="git status"
alias gd="git diff"
alias ga="git add"
alias gp="gitleaks -v --repo=. && git push"
alias gsr="git recursive status"
alias ts='tmux attach -t "$TMUX_SESSION_DEFAULT" || tmux new -s "$TMUX_SESSION_DEFAULT"'

alias grep="grep --line-number --color=auto"

case $(uname) in
    Linux*)
        alias ls="ls -F --color=auto"
        ;;
    Darwin*)  # Mac +Homebrew
        alias ls="ls -FG"
        export PATH=/usr/local/sbin:/usr/local/bin:$PATH    # Homebrew
        for file in /usr/local/etc/bash_completion.d/*; do source $file ; done
        ;;
esac

### Prompt
GIT_PS1_SHOWUPSTREAM=auto
GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWSTASHSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=true

C_Off='\[\e[0m\]'
C_DarkGray='\[\e[1;37m\]'
C_LightGray='\[\e[0;37m\]'
C_DarkGreen='\[\e[0;32m\]'
C_LightGreen='\[\e[1;32m\]'

case $TERM in
    screen*)
        TITLE_PS1='\[\ek\w\e\\\]'
        ;;
esac

export PS1="${TITLE_PS1}${C_DarkGray}\u@\h ${C_DarkGreen}\w${C_DarkGray}\$(__git_ps1)${C_LightGray}>${C_Off} "
