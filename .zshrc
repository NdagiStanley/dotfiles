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
plugins=(git z zsh-autosuggestions)

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
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

if nvm --version &>/dev/null; then
  # place this after nvm initialization!
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
  echo "Node version: $(node -v)"
  echo "\tCMDs: nvm (ls|ls-remote) | nvm install (<version>|--lts) | nvm use (node|--lts|--lts=<LTS name>) | node -v"
  add-zsh-hook chpwd load-nvmrc
  load-nvmrc
fi

## YARN
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# PYTHON
export PATH="/usr/local/opt/python/libexec/bin:$PATH"

## PYENV
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
  echo "Python version: $(pyenv version)"
  echo "\tCMDs: pyenv install (-l) | pyenv version(s) | pyenv (global|local) <version> | python --version"
fi

## Virtualenv
## Precursor: brew install virtualenvwrapper
## Comment the next 6 lines if using pipenv
if virtualenv --help &>/dev/null; then
  export WORKON_HOME=$HOME/.envs
  export PROJECT_HOME=$HOME/Projects/MD
  export VIRTUALENVWRAPPER_PYTHON=$(which python3)
  source /opt/homebrew/bin/virtualenvwrapper.sh
  echo "\tvirtualenvwrapper is available - mkvirtualenv|workon|deactivate"
fi

## PIPX
## To activate completions in zsh, first make sure compinit is marked for
## autoload and run autoload then enable completions for pipx
if pipx --help &>/dev/null; then
  autoload -U compinit && compinit
  eval "$(register-python-argcomplete pipx)"
  echo "\tpipx is available"
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
. "$HOME/.cargo/env"

# JAVA
# Context: https://docs.oracle.com/en/java/javase/20/install/installation-jdk-macos.html
# Download link: https://www.oracle.com/java/technologies/downloads/ - Get the ARM64 DMG Installer
alias javalts='export JAVA_HOME=$(/usr/libexec/java_home)'
alias java23='export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk-23.jdk/Contents/Home'
alias java21='export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk-21.jdk/Contents/Home'
alias java17='export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk-17.jdk/Contents/Home'
# alias java8='export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_311.jdk/Contents/Home'
# java8 only works for x86_64 architecture

# GROOVY
export GROOVY_HOME=/opt/homebrew/opt/groovy/libexec
export PATH="/opt/homebrew/opt/groovy/bin:$PATH"

# KOTLIN
export PATH="/opt/homebrew/opt/kotlin/bin:$PATH"

# ANDROID
export ANDROID_SDK_ROOT="$HOME/Library/Android/Sdk"
export ANDROID_HOME="$HOME/Library/Android/Sdk"
PATH=$PATH:$ANDROID_SDK_ROOT/tools; PATH=$PATH:$ANDROID_SDK_ROOT/platform-tools

# GOLANG
if command -v go &> /dev/null; then
    export GOPATH="${HOME}/.go"
    export GOROOT="$(brew --prefix golang)/libexec"
    export PATH="$PATH:${GOPATH}/bin:${GOROOT}/bin"
fi


## GCLOUD


## JRNL
setopt HIST_IGNORE_SPACE
alias jrnl=" jrnl"
alias jj=" jrnl jot"

## GPG
export GPG_TTY=$(tty)
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

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

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/stanmd/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/stanmd/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/stanmd/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/stanmd/Downloads/google-cloud-sdk/completion.zsh.inc'; fi

# add fastlane
PATH=$PATH:$HOME/.fastlane/bin

# bun completions
[ -s "/Users/stanmd/.bun/_bun" ] && source "/Users/stanmd/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
