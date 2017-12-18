if ! is-macos -o ! is-executable brew; then
  echo "Skipped: Bash 4"
  return
fi

brew uninstall --ignore-dependencies bash || true

chsh -s /bin/bash
