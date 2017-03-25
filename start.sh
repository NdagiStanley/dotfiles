# Install XCode
git clone https://github.com/NdagiStanley/dotfiles.git
cp dotfiles/.vimrc ~/.vimrc

# Vim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

# Zsh
git clone https://github.com/NdagiStanley/rafiki-zsh.git
cp rafiki-zsh/rafiki.zsh-theme $ZSH/custom/themes/rafiki.zsh-theme
vim ~/.zshrc
# ZSH_THEME='rafiki'
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH/zsh-syntax-highlighting

# Install VSCode
# echo "body {-webkit-font-smoothing: antialiased;}" >> /Applications/Visual\ Studio\ Code\ -\ Insiders.app/Contents/Resources/app/out/vs/workbench/electron-browser/workbench.main.css
# Copy vscode_settings.json
