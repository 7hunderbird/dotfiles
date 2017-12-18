if ! is-macos -o ! is-executable brew; then
  echo "Skipped: gem"
  return
fi

brew install gpg2

command curl -sSL https://rvm.io/mpapis.asc | gpg --import -

\curl -sSL https://get.rvm.io | bash -s stable --ruby

source $HOME/.rvm/scripts/rvm

rvm install 2.4.1
rvm use 2.4.1 --default

gem install bundler
gem install cf-uaac
