#!/usr/bin/env bash

function __finish__() {
    source ~/.zshrc
    echo "We're done. Your MAC is now setup!"
}

function __basic__() {
    # Install basic apps
    source brew.sh

    # Install oh-my-zsh
    source install.sh zsh
}

function __core__() {
    # Vim
    cp .vimrc ~/.vimrc
    vim +PluginInstall +qall

    sudo -v
    # Zsh Autosuggestions
    ZSH_AUTOSUGGESTIONS_DIR="$ZSH_CUSTOM/plugins/zsh-autosuggestions"
    if [ ! -d "$ZSH_AUTOSUGGESTIONS_DIR" ]; then
        sudo git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_AUTOSUGGESTIONS_DIR
    fi

    # Rafiki zsh theme
    sudo mkdir -p $ZSH_CUSTOM/themes && sudo curl -o $ZSH_CUSTOM/themes/rafiki.zsh-theme https://raw.githubusercontent.com/NdagiStanley/rafiki-zsh/own-editions/rafiki.zsh-theme

    # Copy functions, aliases, zshrc
    cp .functions ~/.functions
    cp .aliases ~/.aliases
    sudo cp .zshrc ~/.zshrc

    # Link zsh, functions, aliases, git, vim
    __link__
}

function __link__() {
    sh link.sh --main
}

function __work__() {
    echo "Running Work setup..."

    # Vim
    # Copy functions, aliases, zshrc
    # Zsh Autosuggestions
    # Rafiki zsh theme
    __core__

    # Brew install only a few work-critical apps
    source install.sh workbrew

    # Python
    __python__

    # JS
    __javascript__

    # Link zsh, functions, aliases, git, vim
    __link__

    __finish__
}

function __python__() {
    echo "Running Python setup..."
    source install.sh pip
    source code/virtualenvwrapper.sh

    # functions, aliases, zshrc
    cp .functions ~/.functions
    cp .aliases ~/.aliases
    cp .zshrc ~/.zshrc
}

function __javascript__() {
    source install.sh npm

    # npm install
    npm i -g npm@latest
    npm i -g ijavascript
    npm i -g httpster
}

function __pro__() {
    echo "Running Pro setup..."

    # Vim
    # Copy functions, aliases, zshrc
    # Zsh Autosuggestions
    # Rafiki zsh theme
    __core__

    # Brew install everything
    source install.sh probrew

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

function __windows__() {
    echo "Running Windows setup..."
    source install.sh choco
    cd windows_os && source setup.sh
    cd ..
}

if [ "$1" != "" ] && type "__$1__" &> /dev/null; then
    eval "__$1__"
else
    echo "Usage: ./setup.sh (basic/ finish/ core/ python/ javascript/ work/ pro/ windows)"
fi
