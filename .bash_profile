# ~/.bash_profile
# shellcheck shell=bash
# shellcheck disable=SC1090  # Don't follow ~/.*.local files

[ -f ~/.bashrc ]       && source ~/.bashrc
[ -f ~/.bashrc.local ] && source ~/.bashrc.local

export TMUX_SESSION_DEFAULT="BASE"
if [ -z "$TMUX" ]; then
    tmux attach -t "$TMUX_SESSION_DEFAULT" || tmux new -s "$TMUX_SESSION_DEFAULT"
fi

[ -f ~/.bash_profile.local ] && source ~/.bash_profile.local
