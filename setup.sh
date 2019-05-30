#!/usr/bin/env bash

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until `.macos` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

function __finish__() {
    source ~/.zshrc
    echo "We're done. Your MAC is now setup!"
}

function __link__() {
    sh link.sh --all
}

function __pro__() {
    # Vim
    cp .vimrc ~/.vimrc
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    vim +PluginInstall +qall

    # Install everything in Brewfile
    brew bundle --file=mac_os/Brewfile

    # Postgres
    brew services start postgresql
    createdb `whoami`

    # CircleCI CLI
    curl -o /usr/local/bin/circleci https://circle-downloads.s3.amazonaws.com/releases/build_agent_wrapper/circleci && chmod +x /usr/local/bin/circleci

    # Python
    sh code/virtualenvwrapper.sh

    # tmux, functions, aliases, zshrc
    cp .tmux.conf ~/.tmux.conf
    cp .functions ~/.functions
    cp .aliases ~/.aliases
    cp .zshrc ~/.zshrc
    __link__

    # Autosuggestions
    ZSH_AUTOSUGGESTIONS_DIR="$ZSH_CUSTOM/plugins/zsh-autosuggestions"
    if [ ! -d "$ZSH_AUTOSUGGESTIONS_DIR" ]; then
        git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_AUTOSUGGESTIONS_DIR
    fi

    # Rafiki
    mkdir -p $ZSH_CUSTOM/themes && curl -o $ZSH_CUSTOM/themes/rafiki.zsh-theme https://raw.githubusercontent.com/NdagiStanley/rafiki-zsh/own-editions/rafiki.zsh-theme

    __finish__
}

function __basic__() {
    # Install homebrew & basic apps
    sh install.sh homebrew
    sh mac_os/brew.sh

    # Install oh-my-zsh
    sh install.sh zsh
}

function __work__() {
    echo "Running Work setup..."

    # Python
    sh install.sh pip
    sh code/virtualenvwrapper.sh
    
    # `the rest`
    cp .zshrc ~/.zshrc
    cp .functions ~/.functions
    cp .aliases ~/.aliases
    brew install hub

    # Link `the rest`
    sh link.sh zsh
    sh link.sh functions
    sh link.sh aliases
    sh link.sh git

    # Vim
    cp .vimrc ~/.vimrc
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    vim +PluginInstall +qall
    sh link.sh vim

    # Autosuggestions
    ZSH_AUTOSUGGESTIONS_DIR="$ZSH_CUSTOM/plugins/zsh-autosuggestions"
    if [ ! -d "$ZSH_AUTOSUGGESTIONS_DIR" ]; then
        git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_AUTOSUGGESTIONS_DIR
    fi

    # Rafiki
    mkdir -p $ZSH_CUSTOM/themes && curl -o $ZSH_CUSTOM/themes/rafiki.zsh-theme https://raw.githubusercontent.com/NdagiStanley/rafiki-zsh/own-editions/rafiki.zsh-theme

    # JS
    brew install node
    npm i -g npm
    npm i -g node
    npm i -g ijavascript
    npm i -g httpster

    # Install only a few critical apps
    sh install.sh brew
    
    __finish__
}

function __quick__() {
    echo "Running Quick setup..."
    __basic__
    __finish__
}

function __python__() {
    echo "Running Python setup..."
    sh install.sh pip
    cp .zshrc ~/.zshrc
    # I opted not to copy the .aliases and .functions
    sh code/virtualenvwrapper.sh
    __finish__
}

function __windows__() {
    echo "Running Windows setup..."
    sh install.sh choco
    cd windows_os && sh setup.sh
    cd ..
}

if [ "$1" != "" ] && type "__$1__" &> /dev/null; then
    eval "__$1__"
else
    echo "Usage: ./setup.sh (quick/ python/ work/ pro/ windows)"
fi
