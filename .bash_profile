# ~/.bash_profile

[ -f ~/.bashrc ]       && source ~/.bashrc
[ -f ~/.bashrc.local ] && source ~/.bashrc.local    # Optional overrides

export TMUX_SESSION_DEFAULT="BASE"
if [ -z "$TMUX" ]; then
    tmux attach -t "$TMUX_SESSION_DEFAULT" || tmux new -s "$TMUX_SESSION_DEFAULT"
fi

[ -f ~/.bash_profile.local ] && source ~/.bash_profile.local    # Optional overrides
