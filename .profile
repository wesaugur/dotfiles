# ~/.profile
# shellcheck shell=sh

export PATH=~/.local/bin:"$PATH"

export EDITOR=vim
export PAGER=less-color; export LESS="iFRX"

export DOTFILES_GIT_DIR="$HOME/.dotfiles.git"
alias dotfiles='GIT_DIR="$DOTFILES_GIT_DIR" GIT_WORK_TREE="$HOME"'

export HOMEDIR_GIT_DIR="$HOME/.homedir.git"
alias homedir='GIT_DIR="$HOMEDIR_GIT_DIR" GIT_WORK_TREE="$HOME"'

export TMUX_SESSION_DEFAULT="BASE"
[ -n "$TMUX" ] || tmux new -A -s "$TMUX_SESSION_DEFAULT"
