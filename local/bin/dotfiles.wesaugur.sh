#!/bin/sh

# usage: curl https://dotfiles.wesaugur.sh | sh
#   src: code.wes.augur.us/dotfiles

REPO="dotfiles"

set -eu

GITHUB_URL="https://github.com/wesaugur/$REPO.git"
SKIP_DIR="$HOME/.github"

export GIT_DIR="$HOME/.$REPO.git"  # git magic env-var
TMP_WORK_TREE="$HOME/.$REPO.tmp"

git clone --quiet "$GITHUB_URL" --separate-git-dir="$GIT_DIR" "$TMP_WORK_TREE"

export GIT_WORK_TREE="$HOME"  # git magic env-var
git checkout-index --all || [ $? -eq 128 ]
git config --local status.showUntrackedFiles no
git ls-files "$SKIP_DIR" | xargs git update-index --skip-worktree
rm -r "$TMP_WORK_TREE" "$SKIP_DIR"

$HOME/local/bin/permissions-fixup
