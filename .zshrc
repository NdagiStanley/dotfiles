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

# NVM

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

if nvm --version &> /dev/null; then

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
  add-zsh-hook chpwd load-nvmrc
  load-nvmrc
fi

if virtualenv --help &> /dev/null; then
  export WORKON_HOME=$HOME/.envs
  export PROJECT_HOME=$HOME/Projects/MD
  export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python3
  source /usr/local/bin/virtualenvwrapper.sh
fi

## GCLOUD
# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/stanmd/Projects/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/stanmd/Projects/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/stanmd/Projects/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/stanmd/Projects/google-cloud-sdk/completion.zsh.inc'; fi

## JRNL
setopt HIST_IGNORE_SPACE
alias jrnl=" jrnl"
alias jj=" jrnl jot"

## JAVA
alias javalts='export JAVA_HOME=$(/usr/libexec/java_home)'
alias java8='export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_311.jdk/Contents/Home'

# GPG
export GPG_TTY=$(tty)
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
