if ! is-macos -o ! is-executable brew; then
  echo "Skipped: Homebrew not installed"
  return
fi

ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/uninstall)"
