#!/bin/sh

# usage: curl https://dotfiles.wesaugur.sh | sh
#   src: code.wes.augur.us/dotfiles

REPO="dotfiles"

GITHUB_URL="https://github.com/wesaugur/$REPO.git"
SKIP_FILES="$HOME/.github $HOME/LICENSE"

set -eu
export GIT_DIR="$HOME/.$REPO.git"  # git magic env-var
TMP_WORK_TREE="$HOME/.$REPO.tmp"

git clone --quiet "$GITHUB_URL" --separate-git-dir="$GIT_DIR" "$TMP_WORK_TREE"

export GIT_WORK_TREE="$HOME"  # git magic env-var
git checkout-index --all || [ $? -eq 128 ]
git config --local status.showUntrackedFiles no
git ls-files "$SKIP_FILES" | xargs git update-index --skip-worktree
rm -rf "$TMP_WORK_TREE" "$SKIP_FILES"

POST_INSTALL="$HOME/.local/libexec/$REPO/$REPO.post-install"
[ -x "$POST_INSTALL" ] && $POST_INSTALL
