# Install iTerm
# Install Freckle
# Install FirefoxDeveloperEdition
# Install Screenhero
# Install Boom2
# The above don't have brew cask install alternatives

# Install Brew
# Install XCode (by default)
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Vim
cp .vimrc ~/.vimrc
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

sh tap.sh
sh brew.sh
sh cask.sh

# Postgres
brew services start postgresql
createdb `whoami`

# Python
sh virtualenvwrapper.sh

# iTerm
cp iterm2.plist ~/Library/Preferences/com.googlecode.iterm2.plist

# Tmux
cp .tmux.conf ~/.tmux.conf

# CircleCI
curl -o /usr/local/bin/circleci https://circle-downloads.s3.amazonaws.com/releases/build_agent_wrapper/circleci && chmod +x /usr/local/bin/circleci

# Codeclimate
# Command to run
# CODECLIMATE_DEBUG=1 codeclimate analyze

# 21
curl https://21.co | sh

# Zsh
# Install ohmyzsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
cp .zshrc ~/.zshrc
source ~/.zshrc  # Confirm if this line is needed
