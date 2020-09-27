#!/bin/sh -eu
# shellcheck disable=SC2034  # Unused variables

# usage:
# colors_file="$HOME/.local/share/colors.sh"
# [ -f "$colors_file" ] && . "$colors_file"

### Foreground Colors
C_BLACK=$(tput setaf 0)
C_RED=$(tput setaf 1)
C_GREEN=$(tput setaf 2)
C_YELLOW=$(tput setaf 3)
C_BLUE=$(tput setaf 4)
C_MAGENTA=$(tput setaf 5)
C_CYAN=$(tput setaf 6)
C_WHITE=$(tput setaf 7)

C_HI_BLACK=$(tput setaf 8)
C_HI_RED=$(tput setaf 9)
C_HI_GREEN=$(tput setaf 10)
C_HI_YELLOW=$(tput setaf 11)
C_HI_BLUE=$(tput setaf 12)
C_HI_MAGENTA=$(tput setaf 13)
C_HI_CYAN=$(tput setaf 14)
C_HI_WHITE=$(tput setaf 15)

C_RESET=$(tput sgr0)

C_BOLD=$(tput bold)
C_UNDERLINE=$(tput smul)
C_REVERSE=$(tput rev)
