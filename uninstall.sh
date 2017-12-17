#!/usr/bin/env bash

# set -eux

# Get current dir (so run this script from anywhere)

export DOTFILES_DIR DOTFILES_CACHE DOTFILES_EXTRA_DIR
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
DOTFILES_CACHE="$DOTFILES_DIR/.cache.sh"
DOTFILES_EXTRA_DIR="$HOME/.extra"

# Make utilities available

PATH="$DOTFILES_DIR/bin:$PATH"

# Update dotfiles itself first

if is-executable git -a -d "$DOTFILES_DIR/.git"; then git --work-tree="$DOTFILES_DIR" --git-dir="$DOTFILES_DIR/.git" pull origin master; fi

# Remove symlinks

rm -f "$HOME/.bash_profile"
rm -f "$HOME/.inputrc"
rm -f "$HOME/.gemrc"
rm -f "$HOME/.gitconfig"
rm -f "$HOME/.gitignore_global"

# Package managers & packages

#. "$DOTFILES_DIR/install/gem.sh"
. "$DOTFILES_DIR/uninstall/brew-cask.sh"
. "$DOTFILES_DIR/uninstall/bash.sh"
. "$DOTFILES_DIR/uninstall/brew.sh"

exit

# Run tests

# if is-executable bats; then bats test/*.bats; else echo "Skipped: tests (missing: bats)"; fi

# Install extra stuff

# if [ -d "$DOTFILES_EXTRA_DIR" -a -f "$DOTFILES_EXTRA_DIR/install.sh" ]; then
#   . "$DOTFILES_EXTRA_DIR/install.sh"
# fi
