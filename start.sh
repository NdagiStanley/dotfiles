# Install iTerm
# Install Freckle
# Install FirefoxDeveloperEdition, Chrome
# Install Boom2
# Install VSCode
# The above don't have brew cask install alternatives

# Install Brew
# Install XCode (by default)
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Vim
cp .vimrc ~/.vimrc
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

sh brew.md.sh
sh cask.md.sh

# Postgres
brew services start postgresql
createdb `whoami`

# Python
sh virtualenvwrapper.sh

# iTerm
cp iterm2.plist ~/Library/Preferences/com.googlecode.iterm2.plist

# Tmux
cp .tmux.conf ~/.tmux.conf

# CircleCI CLI
curl -o /usr/local/bin/circleci https://circle-downloads.s3.amazonaws.com/releases/build_agent_wrapper/circleci && chmod +x /usr/local/bin/circleci

# Zsh
# Install ohmyzsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
