#!/usr/bin/env bash

function __homebrew__() {
    if ! brew --version &> /dev/null; then
        echo "Installing Homebrew..."
        /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    fi
    echo "Homebrew is already installed"
}

function __zsh__() {
    echo "Installing oh-my-zsh..."
    (sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)") &
}

function __npm__() {
    echo "Installing NPM global packages..."
    brew install node
    while read line; do npm i -g "$line"; done < npm.txt
}

function __brew__() {
    echo "Installing Brew packages..."
    __homebrew__
    brew bundle --file=mac_os/work/Brewfile
}

function __pip__() {
    echo "Installing PIP global packages..."
    brew install python@2
    pip2 install --upgrade pip
    brew install python
    pip install --upgrade pip
    pip install --upgrade -r pip.txt
}

if [ "$1" != "" ] && type "__$1__" &> /dev/null; then
    eval "__$1__"
elif [ "$1" == "--all" ]; then
    __homebrew__
    __zsh__
    ZSH_AUTOSUGGESTIONS_DIR="$ZSH_CUSTOM/plugins/zsh-autosuggestions"
    if [ ! -d "$ZSH_AUTOSUGGESTIONS_DIR" ]; then
        git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_AUTOSUGGESTIONS_DIR
    fi
    __npm__
    __pip__
else
    echo "Usage: ./install.sh (homebrew/ brew/ oh-my-zsh/ npm/ pip/ choco (for Windows OS) | --all)"
fi
