# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="rafiki"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="yyyy-mm-dd"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git z zsh-autosuggestions globalias)

source $ZSH/oh-my-zsh.sh

# Preferred editor all sessions
export EDITOR='vim'

# ssh
export SSH_KEY_PATH="~/.ssh/"

# zsh-syntax-highlighting
if [ -f /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
  source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

# .aliases
if [ -f ~/.aliases ]; then
  source ~/.aliases
fi

# .functions
if [ -f ~/.functions ]; then
  source ~/.functions
fi
export PATH="/usr/local/sbin:$PATH"
export PATH="/Applications/MacPorts/Emacs.app/Contents/MacOS:$PATH"
export PATH="~/.emacs.d/bin:$PATH"

# JAVASCRIPT
## NVM
## Install: https://github.com/nvm-sh/nvm?tab=readme-ov-file#installing-and-updating
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
[ -s "$NVM_DIR/etc/bash_completion.d/nvm" ] && \. "$NVM_DIR/etc/bash_completion.d/nvm" # This loads nvm bash_completion

if nvm --version &>/dev/null; then
  # placed after nvm initialization!
  autoload -U add-zsh-hook
  load-nvmrc() {
    local node_version="$(nvm version)"
    local nvmrc_path="$(nvm_find_nvmrc)"

    if [ -n "$nvmrc_path" ]; then
      local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

      if [ "$nvmrc_node_version" = "N/A" ]; then
        nvm install
      elif [ "$nvmrc_node_version" != "$node_version" ]; then
        nvm use
      fi
    elif [ "$node_version" != "$(nvm version default)" ]; then
      echo "Reverting to nvm default version"
      nvm use default
    fi
  }
  corepack enable ## for yarn
  echo "JS/TS | Node version - $(node -v) <- node -v | npm, npx, yarn are available"
  echo "    nvm is available - nvm (ls|ls-remote) | nvm install (<version>|--lts) |"
  echo "\tnvm use (node|--lts|--lts=<LTS name>)"
  add-zsh-hook chpwd load-nvmrc
  load-nvmrc
fi

## YARN
# export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

## PNPM
if pnpm -h &>/dev/null; then
  alias pn="corepack pnpm"
  echo "    pnpm is available - pn add | pnpx | pni - pnpm i - pnpm install | pn -v"
fi

## NUXT
if nuxi info &>/dev/null; then
  echo "    nuxi is available - (nuxi|nuxt) init (''|--template|--offline)"
  echo "\tMore: https://nuxt.com/docs/4.x/api/commands/dev"
fi

# PYTHON
# export PATH="/usr/local/opt/python/libexec/bin:$PATH"

## PYENV
# Install: brew install pyenv
# Install Python build dependencies - brew install openssl readline sqlite3 xz zlib tcl-tk@8 libb2
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init - zsh)"
  alias brew='env PATH="${PATH//$(pyenv root)\/shims:/}" brew'
  echo "Python version - $(pyenv version --bare | tr '\n' ' ') <- (python3|python2) -V"
  echo "    pyenv is available - pyenv install (-l) | pyenv version(s) |"
  echo "\tpyenv (global|local) (<version>|<version> <version>|2 3)"
fi

## Virtualenv
## Precursor: brew install virtualenvwrapper
## Comment the next 6 lines if using pipenv
# if virtualenv --help &>/dev/null; then
#   export WORKON_HOME=$HOME/.envs
#   export PROJECT_HOME=$HOME/Projects/MD
#   export VIRTUALENVWRAPPER_PYTHON=$(which python3)
#   source /opt/homebrew/bin/virtualenvwrapper.sh
#   echo "\t\tvirtualenvwrapper is available - mkvirtualenv | workon | deactivate"
# fi

## PIPX
## Precursor: brew install pipx | pipx ensurepath
## To activate completions in zsh, first make sure compinit is marked for
## autoload and run autoload then enable completions for pipx
if pipx --help &>/dev/null; then
  autoload -U compinit && compinit
  echo "    pipx is available"
  export PATH="$PATH:/Users/stanmd/.local/bin"
fi

# RUBY
## RBENV
## Precursor: brew install rbenv ruby-build
if [ -d "/opt/homebrew/opt/rbenv/bin" ]; then
  export PATH="$HOME/.rbenv/bin:$PATH"
  eval "$(rbenv init - zsh)"
  echo "Ruby version: $(rbenv global)"
  echo "\tCMDs: rbenv install (-l|<version>) | rbenv global <version>"
fi

## Rust
# Install: curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
if [ -f "$HOME/.cargo/env" ]; then
  . "$HOME/.cargo/env"
fi
if cargo --help &>/dev/null; then
  echo "Rust version - $(cargo --version) <- cargo --version"
  echo "    CMDs: cargo -h | rustup update | rustup doc --book"
fi

# JAVA
# Context: https://docs.oracle.com/en/java/javase/24/install/installation-jdk-macos.html
# Download link: https://www.oracle.com/java/technologies/downloads/#jdk24-mac - Get the ARM64 DMG Installer
# Refer to tauri-ref for more when developing w/ tauri
alias javalts='export JAVA_HOME=$(/usr/libexec/java_home)'
alias java24='export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk-24.jdk/Contents/Home'
alias java23='export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk-23.jdk/Contents/Home'
alias java21='export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk-21.jdk/Contents/Home' # 21 is now the latest LTS of Java SE
# alias java8='export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_311.jdk/Contents/Home'
# java8 only works for x86_64 architecture

# GROOVY
export GROOVY_HOME=/opt/homebrew/opt/groovy/libexec
export PATH="/opt/homebrew/opt/groovy/bin:$PATH"

# KOTLIN
export PATH="/opt/homebrew/opt/kotlin/bin:$PATH"

# ANDROID
export ANDROID_SDK_ROOT="$HOME/Library/Android/sdk"
export ANDROID_HOME="$HOME/Library/Android/sdk"
PATH=$PATH:$ANDROID_HOME/tools
PATH=$PATH:$ANDROID_HOME/platform-tools

# GOLANG
# https://go.dev/doc/install OR via brew (brew install go)
# Typically, this is not necessary because Installer and Homebrew sets it up correctly
# If brew and when needed uncomment the lines below to set up the GOROOT environment variable
if command -v go &>/dev/null; then
  export GOPATH=$HOME/go
  export PATH=$PATH:$GOPATH/bin
  echo "Golang version - $(go version) <- go version"
  echo "    CMDs: go help"
fi

## GCLOUD

## JRNL
# pipx install jrnl
setopt HIST_IGNORE_SPACE
alias jrnl=" jrnl"
alias jj=" jrnl jot"

## GPG
export GPG_TTY=$(tty)
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion

## Brew
export HOMEBREW_GITHUB_API_TOKEN=

# pnpm
export PNPM_HOME="/Users/stanmd/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# Load Angular CLI autocompletion.
# source <(ng completion script)

# add fastlane
PATH=$PATH:$HOME/.fastlane/bin

# bun completions
[ -s "/Users/stanmd/.bun/_bun" ] && source "/Users/stanmd/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

## x-cmd.com
## eval "$(curl https://get.x-cmd.com)"
# [ ! -f "$HOME/.x-cmd.root/X" ] || . "$HOME/.x-cmd.root/X" # boot up x-cmd.

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/stanmd/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/stanmd/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/stanmd/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/stanmd/google-cloud-sdk/completion.zsh.inc'; fi

CLOUDSDK_PYTHON=/Users/stanmd/.pyenv/shims/python3
