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
    sh link.sh --main
}

function __core__() {
    # Vim
    cp .vimrc ~/.vimrc
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    vim +PluginInstall +qall

    # Zsh Autosuggestions
    ZSH_AUTOSUGGESTIONS_DIR="$ZSH_CUSTOM/plugins/zsh-autosuggestions"
    if [ ! -d "$ZSH_AUTOSUGGESTIONS_DIR" ]; then
        git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_AUTOSUGGESTIONS_DIR
    fi

    # Rafiki zsh theme
    mkdir -p $ZSH_CUSTOM/themes && curl -o $ZSH_CUSTOM/themes/rafiki.zsh-theme https://raw.githubusercontent.com/NdagiStanley/rafiki-zsh/own-editions/rafiki.zsh-theme

    # Copy functions, aliases, zshrc
    cp .functions ~/.functions
    cp .aliases ~/.aliases
    cp .zshrc ~/.zshrc

    # Link zsh, functions, aliases, git, vim
    __link__
}

function __pro__() {
    echo "Running Pro setup..."

    # Vim
    # Copy functions, aliases, zshrc
    # Zsh Autosuggestions
    # Rafiki zsh theme
    __core__

    # Brew install everything
    sh install.sh probrew

    # Python
    __python__

    # JS
    __javascript__

    # Postgres
    brew services start postgresql
    createdb `whoami`

    # CircleCI CLI
    curl -o /usr/local/bin/circleci https://circle-downloads.s3.amazonaws.com/releases/build_agent_wrapper/circleci && chmod +x /usr/local/bin/circleci

    # tmux
    cp .tmux.conf ~/.tmux.conf

    # Link tmux
    sh link.sh tmux

    __finish__
}

function __basic__() {
    # Install homebrew & basic apps
    sh install.sh homebrew
    sh brew.sh

    # Install oh-my-zsh
    sh install.sh zsh
}

function __work__() {
    echo "Running Work setup..."

    # Vim
    # Copy functions, aliases, zshrc
    # Zsh Autosuggestions
    # Rafiki zsh theme
    __core__

    # Brew install only a few work-critical apps
    sh install.sh workbrew

    # Python
    __python__

    # JS
    __javascript__

    # Link `the rest`
    sh link.sh zsh
    sh link.sh functions
    sh link.sh aliases
    sh link.sh git
    sh link.sh vim

    __finish__
}

function __python__() {
    echo "Running Python setup..."
    sh install.sh pip
    sh code/virtualenvwrapper.sh

    # functions, aliases, zshrc
    cp .functions ~/.functions
    cp .aliases ~/.aliases
    cp .zshrc ~/.zshrc
}

function __javascript__() {
    sh install.sh npm

    # npm install
    npm i -g npm
    npm i -g node
    npm i -g ijavascript
    npm i -g httpster
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
    echo "Usage: ./setup.sh (basic/ finish/ python/ javascript/ work/ pro/ windows)"
fi
