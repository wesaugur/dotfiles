#!/bin/sh

# usage: curl https://dotfiles.wesaugur.sh | sh
#   src: code.wes.augur.us/dotfiles

REPO="dotfiles"

set -eu

GITHUB_URL="https://github.com/wesaugur/$REPO.git"
SKIP_DIR="$HOME/.github"

export GIT_DIR="$HOME/.$REPO.git"  # git magic env-var
export GIT_WORK_TREE="$HOME"       # git magic env-var

git clone --quiet --bare "$GITHUB_URL" "$GIT_DIR"
git config --local status.showUntrackedFiles no
git checkout || { rm -r "$GIT_DIR"; exit 1; }

git ls-files "$SKIP_DIR" | xargs git update-index --skip-worktree
rm -r "$SKIP_DIR"

$HOME/local/bin/permissions-fixup
