#!/usr/bin/env bash

function __brew__() {
    # Brewfile
    echo "Dumping all things brew to Brewfile"
    brew bundle dump --force
    echo "Move the Brewfile to 'mac_os' or 'mac_os/work'"
}

function __npm__() {
    # Global NPM packages
    echo "Dumping npm packages to npm.txt"
    npm ls -g -j --depth=0 | jq -r '.dependencies|keys|join("\n")' > npm.txt
}

function __pip__() {
    # PIP packages
    echo "Dumping PIP packages to pip.txt"
    pip3 install --upgrade pip

    # pip-chill is not globally installed so that
    # it doesn't clash with the package installed in virtual environments
    pip3 install pip-chill
    pip-chill --no-version > pip.txt
    pip3 uninstall pip-chill -y

    echo "Done!"
}

if [ "$1" != "" ] && type "__$1__" &> /dev/null; then
    eval "__$1__"
elif [ "$1" == "--complete" ]; then
    __brew__
    __npm__
    __pip__
else
    echo "Usage: ./sync.sh (brew/ npm/ pip | --complete)"
fi
