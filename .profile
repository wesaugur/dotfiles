# ~/.profile
# shellcheck shell=sh
# shellcheck disable=SC1090  # Don't follow non-constant source
# shellcheck disable=SC1091  # Don't follow external source
# COMPATIBILITY: POSIX sh, bash, ksh, zsh, fish

export ENV="$HOME/.shrc"  # Run Commands for POSIX interactive shells

export PATH="$HOME/.local/bin:$HOME/.local/sbin:$PATH"

export EDITOR=vim
# export VISUAL="subl --wait"
export PAGER=less-color; export LESS="iFRX"

export TMUX_SESSION_NAME="BASE"

export DOTFILES_GIT_DIR="$HOME/.dotfiles.git"
export  HOMEDIR_GIT_DIR="$HOME/.homedir.git"

command -v fd > /dev/null && \
    export FZF_FD="fd --hidden --follow --exclude=.git/" && \
    export FZF_DEFAULT_COMMAND="$FZF_FD --type=file"     && \
    export FZF_ALT_C_COMMAND="$FZF_FD --type=directory"  && \
    export FZF_CTRL_T_COMMAND="$FZF_FD"

export FZF_DEFAULT_OPTS="--height=40% --layout=reverse-list"
export FZF_CTRL_T_OPTS="--preview='cat {} 2> /dev/null || tree -aFC {} | head -n 100'"
export FZF_ALT_C_OPTS="--preview='tree -aFC {} | head -n 100'"

export RIPGREP_CONFIG_PATH="$HOME/.config/ripgrep/ripgrep.conf"

export SSH_AGENT_ENV="$HOME/.ssh/agent.env"
pgrep -u "$USER" ssh-agent > /dev/null && [ ! -f "$SSH_AGENT_ENV" ] && \
    pkill -u "$USER" ssh-agent
[ "$FISH_VERSION" ] && eval 'set ssh_agent_args -c'
# shellcheck disable=SC2154  # $ssh_agent_args is unassigned
# shellcheck disable=SC2086  # $ssh_agent_args list not double quoted
pgrep -u "$USER" ssh-agent > /dev/null || \
    ssh-agent $ssh_agent_args > "$SSH_AGENT_ENV"
[ "$SSH_AUTH_SOCK" ] || . "$SSH_AGENT_ENV" > /dev/null

[ -f /opt/homebrew/bin/brew ] && eval "$(/opt/homebrew/bin/brew shellenv)"

export PATH="$HOME/.pyenv/bin:$PATH"
[   "$FISH_VERSION" ] && command -v pyenv > /dev/null && \
    eval 'pyenv init --path | source'
[ ! "$FISH_VERSION" ] && command -v pyenv > /dev/null && \
    eval 'eval "$(pyenv init --path)"'

[ "$BASH_VERSION" ] && [ "$PS1" ] && [ -f ~/.bashrc ]      && . ~/.bashrc
[ "$KSH_VERSION" ]  && [ "$PS1" ] && [ -f /etc/ksh.kshrc ] && . /etc/ksh.kshrc

[ -f ~/.profile.local ] && . ~/.profile.local
