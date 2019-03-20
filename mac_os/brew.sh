# Used by the ./setup.sh --quick command

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

brew install tree 2> /dev/null
brew install wget 2> /dev/null

brew cask install google-chrome 2> /dev/null

# Remove outdated versions from the cellar.
brew cleanup
