# ~/.bash_profile
# shellcheck shell=bash
# shellcheck disable=SC1090  # Don't follow ~/.*.local files

[ -f ~/.bashrc ]       && source ~/.bashrc
[ -f ~/.bashrc.local ] && source ~/.bashrc.local

[ -f ~/.bash_profile.local ] && source ~/.bash_profile.local
