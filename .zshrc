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
HIST_STAMPS="mm.dd.yyyy"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git z zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

# virtualenvwrapper configuration
if [ -f /usr/local/bin/virtualenvwrapper.sh ]; then
    export WORKON_HOME=~/Envs
    export PROJECT_HOME=~/Projects
    export VIRTUALENVWRAPPER_PYTHON=`which python3`
    source /usr/local/bin/virtualenvwrapper.sh
fi

# You may need to manually set your language environment
export LANG=en_GB.UTF-8
# (LC_ALL became necessary for pip-env)
export LC_ALL=en_GB.UTF-8

# Preferred editor all sessions
export EDITOR='vim'

# ssh
export SSH_KEY_PATH="~/.ssh/"

# zsh-syntax-highlighting
if [ -f /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
    source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

# Go
# Install gvm - https://github.com/moovweb/gvm plus the version(s) you want
# gvm use go1.6.2
# For Google App Engine
# Install it - https://cloud.google.com/appengine/docs/standard/go/download
# export PATH="$PATH:$HOME/go_appengine"
# ensure you have a GO directory with src directory
# export GOPATH="$GOPATH:$HOME/GO"

export GOPATH="${HOME}/.go"
export GOROOT="$(brew --prefix golang)/libexec"
export PATH="$PATH:${GOPATH}/bin:${GOROOT}/bin"


test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# GNU Command Line Tools
export PATH="$(brew --prefix coreutils)/libexec/gnubin:/usr/local/bin:$PATH"

if [ -f ~/.aliases ]; then
    source ~/.aliases
fi

if [ -f ~/.functions ]; then
    source ~/.functions
fi

# heroku autocomplete setup
HEROKU_AC_ZSH_SETUP_PATH=/Users/stanmd/Library/Caches/heroku/autocomplete/zsh_setup && test -f $HEROKU_AC_ZSH_SETUP_PATH && source $HEROKU_AC_ZSH_SETUP_PATH;
export PATH="/usr/local/opt/openssl/bin:$PATH"
