# Install iTerm
# Install Browser
# Install VSCode
# The above don't have brew cask install alternatives

# Install Brew
# Install XCode (by default)
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

sh brew.sh
sh cask.sh

# Postgres
brew services start postgresql
createdb `whoami`

# Python
sh virtualenvwrapper.sh

# Zsh
# Install ohmyzsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
cp .zshrc ~/.zshrc
