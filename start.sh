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

# Zsh
# Install ohmyzsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
cp .zshrc ~/.zshrc
source ~/.zshrc  # Confirm if this line is needed

# Autosuggestions
git clone git://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions

# Rafiki
mkdir -p $ZSH_CUSTOM/themes && curl -o $ZSH_CUSTOM/themes/rafiki.zsh-theme https://raw.githubusercontent.com/NdagiStanley/rafiki-zsh/develop/rafiki.zsh-theme
source ~/.zshrc

cd
zsh
