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

function __claude__() {
    mkdir -p "$HOME/.claude"
    ln -sfv "$(pwd)/claude/CLAUDE.md" "$HOME/.claude/CLAUDE.md"
}

function __gemini__() {
    mkdir -p "$HOME/.gemini"
    ln -sfv "$(pwd)/gemini/GEMINI.md" "$HOME/.gemini/GEMINI.md"
}

function __openai__() {
    mkdir -p "$HOME/.codex"
    ln -sfv "$(pwd)/openai/AGENTS.md" "$HOME/.codex/AGENTS.md"
}

function __zed__() {
    mkdir -p "$HOME/.config/zed"
    ln -sfv "$(pwd)/zed/settings.json" "$HOME/.config/zed/settings.json"
    ln -sfv "$(pwd)/zed/keymap.json" "$HOME/.config/zed/keymap.json"
}

function __antigravity__() {
    local agy_dir="$HOME/Library/Application Support/Antigravity/User"
    mkdir -p "$agy_dir"
    ln -sfv "$(pwd)/antigravity/settings.json" "$agy_dir/settings.json"
    ln -sfv "$(pwd)/antigravity/keybindings.json" "$agy_dir/keybindings.json"
}

function __antigravity_ide__() {
    local agy_ide_dir="$HOME/Library/Application Support/Antigravity IDE/User"
    mkdir -p "$agy_ide_dir"
    ln -sfv "$(pwd)/antigravity-ide/settings.json" "$agy_ide_dir/settings.json"
}


function __warp__() {
    mkdir -p "$HOME/.warp/tab_configs"
    ln -sfv "$(pwd)/warp/settings.toml" "$HOME/.warp/settings.toml"
    ln -sfv "$(pwd)/warp/keybindings.yaml" "$HOME/.warp/keybindings.yaml"
    ln -sfv "$(pwd)/warp/tab_configs/startup_config.toml" "$HOME/.warp/tab_configs/startup_config.toml"
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
    __cz__
    __claude__
    __gemini__
    __openai__
    __zed__
    __antigravity__
    __antigravity_ide__
    __warp__
else
    echo "Usage: ./link.sh (zsh/ functions/ aliases/ tmux/ git/ vim/ cz/ claude/ gemini/ openai/ zed/ antigravity/ antigravity_ide/ warp/ windows (for Windows OS) | --main)"
fi
