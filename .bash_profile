# ~/.bash_profile

if [ -f ~/.bashrc ]; then
    source ~/.bashrc
fi

export TMUX_SESSION_DEFAULT="BASE"
if [ -z "$TMUX" ]; then
    tmux attach -t "$TMUX_SESSION_DEFAULT" || tmux new -s "$TMUX_SESSION_DEFAULT"
fi
