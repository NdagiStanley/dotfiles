# dotfiles

[![OS](https://img.shields.io/badge/OS-macOS-informational?style=flat-square&logo=apple&logoColor=white)](https://en.wikipedia.org/wiki/MacOS)
[![OS](https://img.shields.io/badge/OS-Linux-informational?style=flat-square&logo=linux&logoColor=white)](https://en.wikipedia.org/wiki/Linux)
[![Editor](https://img.shields.io/badge/Editor-VSCode-blue?style=flat-square&logo=visual-studio-code&logoColor=white)](https://code.visualstudio.com/)

## Summary

1. Install GIT
2. Clone this repo
3. Use this repo's scripts to set up machine (In four modes: **Basic**, **Core**, **Work**, **Pro**)
4. Et al (Others)

> Please note that:

- The steps below are for **macOS** and **Linux**. For **Windows**, follow the instructions [here](/windows_os).

- After installing GIT, there will be very little difference between Unix and Linux setup, for steps 2 and 3, especially since I'm using HomeBrew which works for both.

## 1. GIT

### macOS

First, install Xcode Command Line Tools from the App Store:

```sh
xcode-select --install
```

### Linux

Run:

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"
```

then:

```bash
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

```bash
sh install.sh --all
```

> You'll be prompted for your password

then run:

```bash
sh setup.sh pro
```

### Edge case - shared machine

For a recurrent server or workstation (that's not personal), I just install `zsh` then install `oh-my-zsh` (See command at [**install.sh**](install.sh#L14)). The aliases are a time-saver!

## 4. Et al

### macOS settings

Find macOS settings and app settings in [mac_os folder](/mac_os/).

### Maintenance

Once in a while I run:

- `sh sync.sh --complete`

    _to sync up the `dotfiles` and push to GitHub. This applies to you if you forked this repo_

- `update`

    _to run a system-wide update (I do it almost daily)_ 🙂

- `cleanup`

    _to clean **.Trashes**, **.DS_Store** among others, plus **docker system prune**_

### Code

For code-specific dotfiles checkout the [code folder](/code).

### GIT

> SSH keys

```bash
ssh-keygen -t rsa -b 4096 -C ".."
eval $(ssh-agent -s)
ssh-add ~/.ssh/id_rsa
pbcopy < ~/.ssh/id_rsa.pub
```

> The last command is different in [Linux](/linux_os#git) and [Windows](/windows_os#git) ([Reference](https://help.github.com/en/articles/adding-a-new-ssh-key-to-your-github-account))

The SSH Public Key is now in your clipboard. Navigate to [this page](https://github.com/settings/keys), click on **New SSH key**, enter a _title_, paste the _Public Key_ and click on **Add SSH key**.
