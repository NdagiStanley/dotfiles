#!/usr/bin/env bash

# Brewfile
echo "Dumping all things brew to Brewfile"
brew bundle dump --force

# Global NPM packages
echo "Dumping npm packages to npm.txt"
npm ls -g -j --depth=0 | jq -r '.dependencies|keys|join("\n")' > npm.txt

# PIP packages
echo "Dumping PIP packages to pip.txt"
pip3 install --upgrade pip
pip3 freeze > pip.txt
echo "Done!"
