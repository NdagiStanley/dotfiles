# dotfiles

First, install Xcode Command Line Tools from the App Store

```
xcode-select --install
```

Next, clone this repo
```
git clone https://github.com/NdagiStanley/dotfiles.git && cd dotfiles
```

# UNIX/ LINUX

### Caveat

There is very little difference between Unix and Linux setup. Brew works for both.

However for Linux, installation is different so just run:

> Linux installation

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

Then proceed.

_Please note that, for Linux, where __mas__ is used (in the Brewfiles) utilized when running `sh setup.sh work` and `sh setup.sh pro` an error will occur. Ignore this._

For a recurrent server or workstation (that's not personal), I just install oh-my-zsh by running `sh install zsh`. The bare minimum aliases are a time-saver!


## Quick setup
```
sh setup.sh basic
```
> You'll be prompted for your password

then run:
```
sh setup.sh finish
```


### Python

There's an option for running setup specific to python by running:

> Ensure you've run __`sh setup.sh basic`__ before you proceed
  ```
  sh setup.sh python
  ```


## Work-mode
```
sh setup.sh basic
```
> You'll be prompted for your password

then run:
```
sh setup.sh work
```


## PRO-mode

To have my setup (which has a bit more installs and configuration) run:

_Install homebrew, oh-my-zsh, npm packages & pip packages_
```
sh install.sh --all
```
> You'll be prompted for your password

then run:

```
sh setup.sh pro
```

# Windows OS

Follow the instructions [here](/windows_os).

# Et al

## Maintenance

Once in a while I run:

- `sh sync.sh --complete`

    _to sync up the dotfiles and push to Github. This applies to you if you forked this repo or have your own dotfiles hosted online_

- `update`

    _to run a system-wide update (I do it almost daily)_ 🙂

- `cleanup`

    _to clean **.Trashes**, ***.DS_Store** among others plus **docker system prune**_

## CODE

For code-specific dotfiles checkout the [code folder](/code)

## MAC

Run `sh mac_os/setup.sh` for specific my custom *System Preferences* setup. Edit it as you may please.

## GIT

_SSH keys_
```
ssh-keygen -t rsa -b 4096 -C ".."
eval $(ssh-agent -s)
ssh-add ~/.ssh/id_rsa
pbcopy < ~/.ssh/id_rsa.pub
```
> The last command is different in [Linux](/linux_os#git) and [Windows](/windows_os#git) ([Reference](https://help.github.com/en/articles/adding-a-new-ssh-key-to-your-github-account))

The SSH Public Key is now in your clipboard. Navigate to [this page](https://github.com/settings/keys), click on **New SSH key**, enter a _title_, paste the _Public Key_ and click on **Add SSH key**.
