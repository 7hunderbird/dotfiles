if ! is-macos -o ! is-executable brew; then
  echo "Skipped: gem"
  return
fi

gpg --delete-keys 409B6B1796C275462A1703113804BB82D39DC0E3

brew deps gpg2 | xargs brew remove --ignore-dependencies && brew missing
brew uninstall gpg2

rvm implode --force
