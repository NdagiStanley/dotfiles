# dotfiles

Install Xcode Command Line Tools from the App Store.

`xcode-select --install`

Clone repo `git clone https://github.com/NdagiStanley/dotfiles.git && cd dotfiles` and RUN:

`sh setup.sh quick`

> Python

- There's an option for running setup specific to python by running:

    `sh setup.sh python`

## PRO-MODE

To have my setup (which has a bit more installs and configuration) run:

`sh setup.sh --complete && update`

Once in a while run `sh sync.sh` to sync up the dotfiles and push to github.

### CODE

For code-specific dotfiles checkout the [code folder](/code)

### MAC

Run `./.macos` for specific my custom *System Preferences* setup. Edit it as you may please.
