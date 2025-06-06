#!/usr/bin/env bash

function __zsh__() {
    ln -sfv "$(pwd)/.zshrc" "$HOME/.zshrc"
}

function __functions__() {
    ln -sfv "$(pwd)/.functions" "$HOME/.functions"
}

function __aliases__() {
    ln -sfv "$(pwd)/.aliases" "$HOME/.aliases"
}

function __tmux__() {
    ln -sfv "$(pwd)/.tmux.conf" "$HOME/.tmux.conf"
}

function __git__() {
    ln -sfv "$(pwd)/git/.gitconfig" "$HOME/.gitconfig"
    ln -sfv "$(pwd)/git/.gitignore_global" "$HOME/.gitignore_global"
}

function __vim__() {
    ln -sfv "$(pwd)/.vimrc" "$HOME/.vimrc"
}

function __cz__() {
    ln -sfv "$(pwd)/.czrc" "$HOME/.czrc"
}

function __windows__() {
    cd windows_os && source link.sh
}

if [ "$1" != "" ] && type "__$1__" &> /dev/null; then
    eval "__$1__"
elif [ "$1" == "--main" ]; then
    __zsh__
    __functions__
    __aliases__
    __git__
    __vim__
else
    echo "Usage: ./link.sh (zsh/ functions/ aliases/ tmux/ git/ vim/ cz/ windows (for Windows OS) | --main)"
fi
