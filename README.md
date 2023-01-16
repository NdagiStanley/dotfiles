# dotfiles

[![OS](https://img.shields.io/badge/OS-macOS-informational?style=flat-square&logo=apple&logoColor=white)](https://en.wikipedia.org/wiki/MacOS)
[![OS](https://img.shields.io/badge/OS-Linux-informational?style=flat-square&logo=linux&logoColor=white)](https://en.wikipedia.org/wiki/Linux)
[![OS](https://img.shields.io/badge/OS-Windows-informational?style=flat-square&logo=windows&logoColor=white)](https://en.wikipedia.org/wiki/Windows)

## Summary

1. [Install GIT](#1-git)
2. [Clone this repo](#2-clone-repository)
3. [Scripts](#3-scripts)

    Use this repo's scripts to set up machine (In six modes: [**Basic**](#basic), [**Core**](#core), [**Python**](#python), [**JavaScript**](#javascript), [**Work**](#work), and [**Pro**](#pro))

    For a recurrent server or workstation (that's not personal), there are two options: (The aliases are a time-saver!)
    - (Easy and quick) Copy [.aliases-basic](/.aliases-basic) to `.aliases` and run `source .aliases` for every new shell session

      ```sh
      curl https://raw.githubusercontent.com/NdagiStanley/dotfiles/main/.aliases-basic > .aliases
      source .aliases
      ```

    - Install `zsh`, [install oh-my-zsh](/install.sh#L20), copy [.zshrc-basic](/.zshrc-basic) to `.zshrc` and run `source .zshrc`

4. [Et al (Others)](#4-et-al)

    - [macOS settings](#macos-settings)
    - [Code](#code)
    - [Maintenance](#maintenance)
    - [Git](#git)

> Please note that:

- The steps below are for **macOS** (Unix) and **Linux** (*nix). For **Windows**, follow the instructions in [windows_os](/windows_os). Find more specific notes on macOS and Linux in [mac_os](/mac_os) and [linux_os](/linux_os/).

- After installing GIT, there will be very little difference between Unix and Linux setup, for steps 2 and 3, especially since I'm using HomeBrew which works for both.

## 1. GIT

### macOS

First, install Xcode Command Line Tools from the App Store:

```sh
xcode-select --install
```

**HINT**: <i>Since this app is huge, you can transfer Xcode from a similar macOS machine via AirPlay to fast track this.</i>

### Linux

Run:

```sh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"
```

then:

```sh
test -d ~/.linuxbrew && eval $(~/.linuxbrew/bin/brew shellenv)
test -d /home/linuxbrew/.linuxbrew && eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
test -r ~/.bash_profile && echo "eval \$($(brew --prefix)/bin/brew shellenv)" >>~/.bash_profile
echo "eval \$($(brew --prefix)/bin/brew shellenv)" >>~/.profile
```

and finally:

```bash
sudo apt-get install build-essential curl file git
```

## 2. Clone repository

```sh
git clone https://github.com/NdagiStanley/dotfiles.git && cd dotfiles
```

## 3. Scripts

### Basic

Install homebrew, (basic brew packages) and oh-my-zsh.

```sh
sh setup.sh basic
```

> You'll be prompted for your password

To reload the shell, run:

```sh
sh setup.sh finish
```

### Core

> Ensure you've run **`sh setup.sh basic`** before you proceed

```sh
sh setup.sh core
sh setup.sh finish
```

### Python

There's an option for running setup specific to python by running:

> Ensure you've run **`sh setup.sh basic`** before you proceed

```sh
sh setup.sh python
sh setup.sh finish
```

### JavaScript

There's an option for running setup specific to JavaScript by running:

> Ensure you've run **`sh setup.sh basic`** before you proceed

```sh
sh setup.sh javascript
sh setup.sh finish
```

### Work

> Ensure you've run **`sh setup.sh basic`** before you proceed

`Work` mode includes the [Python](#python) and [JavaScript](#javascript) modes. I use mainly these two programming languages. Take a look at [my GitHub profile](https://github.com/NdagiStanley/NdagiStanley#--hello-world).

```sh
sh setup.sh work
```

### Pro

To have my setup (which has a bit more installs and configuration); install homebrew, oh-my-zsh, npm packages & pypi packages by running:

```sh
sh install.sh --all
```

> You'll be prompted for your password

then run:

```sh
sh setup.sh pro
```

## 4. Et al

### macOS settings

Find macOS settings and app settings in [mac_os](/mac_os).

### Code

Find code-specific dotfiles in [code](/code).

### Maintenance

Once in a while I run:

- `sh sync.sh --complete`

    _to sync up the `dotfiles` and push to GitHub. This applies to you if you forked this repo_

- `update`

    _to run a system-wide update (I do it almost daily)_ 🙂

- `cleanup`

    _to clean **.Trashes**, **.DS_Store** among others, plus **docker system prune**_

### GIT

#### SSH keys

```bash
ssh-keygen -t ed25519 -C ".."
eval $(ssh-agent -s)
ssh-add ~/.ssh/id_ed25519
pbcopy < ~/.ssh/id_ed25519.pub
```

> The last command is different in [Linux](/linux_os#git) and [Windows](/windows_os#git) ([Reference](https://help.github.com/en/articles/adding-a-new-ssh-key-to-your-github-account))

The SSH Public Key is now in your clipboard. Navigate to [this page](https://github.com/settings/keys), click on **New SSH key**, enter a _title_, paste the _Public Key_ and click on **Add SSH key**.

#### Configuration

To set the email (globally or locally respectively), run:

```sh
git config --global user.email <email>  # global
git config user.email <email>           # per repo
```

#### Commitizen

To use Conventional Commits, use [commitizen CLI](https://commitizen-tools.github.io/commitizen). For *nix (**macOS** (Unix) and **Linux**), use Homebrew to install `commitizen`. The [default Brewfile](/mac_os/Brewfile) has it.

Common commands below. Find more [here](https://commitizen-tools.github.io/commitizen/#usage).

```sh
cz c # OR cz commit               - commit
cz ch # OR cz changelog           - Changelog
cz changelog 0.0.1                # Changelog for specific version
```

#### GPG

Have `gpg` installed. For *nix (**macOS** (Unix) and **Linux**), use Homebrew. The [default Brewfile](/mac_os/Brewfile) has it.

```sh
gpg --version # version 2+
gpg --full-gen-key
gpg --list-secret-keys --keyid-format LONG <email>
gpg --armor --export <KEY>
```

> Making commits

```sh
git commit -S -m "commit message"       # Signed commit
cz commit -s # OR cz commit --signoff   - Signed commit using commitizen
```

> Automatic signed commits

```sh
git config --global user.signingkey <KEY> # global
git config user.signingkey <KEY>          # per repo
```
