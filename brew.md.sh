# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

brew install codeclimate 2> /dev/null
brew install ctags 2> /dev/null  # for indexing of files, simply put
brew install htop 2> /dev/null
brew install heroku 2> /dev/null
brew install httpie 2> /dev/null
brew install hub 2> /dev/null
brew install mercurial 2> /dev/null
brew install mysql 2> /dev/null
brew install node 2> /dev/null
brew install postgres 2> /dev/null
brew install python 2> /dev/null
brew install python3 2> /dev/null
brew install ruby 2> /dev/null
brew install tmux 2> /dev/null
brew install tree 2> /dev/null
brew install wget 2> /dev/null
brew install zsh-syntax-highlighting 2> /dev/null

# Remove outdated versions from the cellar.
brew cleanup
