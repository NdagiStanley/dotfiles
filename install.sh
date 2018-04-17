#!/usr/bin/env bash

function __homebrew__() {
    if ! brew --version &> /dev/null; then
        echo "Installing Homebrew..."
        /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    fi
    echo "Homebrew is already installed"
}

function __oh-my-zsh__() {
    echo "Installing oh-my-zsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

    ZSH_AUTOSUGGESTIONS_DIR="$ZSH_CUSTOM/plugins/zsh-autosuggestions"
    if [ ! -d "$ZSH_AUTOSUGGESTIONS_DIR" ]; then
        git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_AUTOSUGGESTIONS_DIR
    fi
}

function __npm__() {
    echo "Installing NPM global packages..."
    while read line; do npm i -g "$line"; done < npm.txt
}

function __pip__() {
    echo "Installing PIP global packages..."
    pip3 install --upgrade -r pip.txt
}

if [ "$1" != "" ] && type "__$1__" &> /dev/null; then
    eval "__$1__"
elif [ "$1" == "--all" ]; then
    __homebrew__
    __oh-my-zsh__
    __npm__
    __pip__
else
    echo "Usage: ./install.sh (homebrew/ oh-my-zsh/ npm/ pip | --all)"
fi
