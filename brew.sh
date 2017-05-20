# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

brew install ctags # for indexing of files, simply put
brew install heroku
brew install httpie
brew install hub
brew install mysql
brew install postgres
brew install tree
brew install wget
brew install zsh-syntax-highlighting

# Remove outdated versions from the cellar.
brew cleanup
