# ==============================================================================
# ZSH CONFIGURATION
# ==============================================================================

# 1. ARCHITECTURE DETECTION - MACOS: INTEL + APPLE SILICON
# ------------------------------------------------------------------------------
if [ -d "/opt/homebrew" ]; then
  HOMEBREW_PREFIX="/opt/homebrew"
else
  HOMEBREW_PREFIX="/usr/local"
fi

# 2. CORE SHELL & OH-MY-ZSH
# ------------------------------------------------------------------------------
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="rafiki"
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"
HIST_STAMPS="yyyy-mm-dd"

# Enforce unique paths automatically
typeset -U path PATH

plugins=(git z zsh-autosuggestions globalias)
source $ZSH/oh-my-zsh.sh

# 3. GLOBAL ENVIRONMENT
# ------------------------------------------------------------------------------
export EDITOR='vim'
export GPG_TTY=$(tty)
export SSH_KEY_PATH="$HOME/.ssh/"
export MANPAGER='less -X'
export LESS_TERMCAP_md="${yellow}"
export HOMEBREW_GITHUB_API_TOKEN=""

# JRNL
setopt HIST_IGNORE_SPACE
alias jrnl=" jrnl"
alias jj=" jrnl jot"

# Load Aliases and Functions
[ -f ~/.aliases ] && source ~/.aliases
[ -f ~/.bash_aliases ] && source ~/.bash_aliases
[ -f ~/.functions ] && source ~/.functions

# 4. PATH HIERARCHY
# ------------------------------------------------------------------------------
# JUSTIFICATION: Direct assignment is faster than checking [ -d ].
# We rely on HOMEBREW_PREFIX to get the right path for the right chip.

path=(
  # System Basics
  /usr/local/bin
  /usr/bin
  /bin
  /usr/sbin
  /sbin

  # Homebrew (Dynamic)
  $HOMEBREW_PREFIX/sbin
  $HOMEBREW_PREFIX/bin
  $HOMEBREW_PREFIX/opt/kotlin/bin
  $HOMEBREW_PREFIX/opt/groovy/bin

  # User Binaries
  $HOME/.local/bin
  $HOME/.fastlane/bin
  $HOME/.antigravity/antigravity/bin
  $HOME/.bun/bin
  $HOME/.cargo/bin
  $HOME/go/bin

  # Android (Modern & Legacy)
  $HOME/Library/Android/sdk/platform-tools
  $HOME/Library/Android/sdk/cmdline-tools/latest/bin
  $HOME/Library/Android/sdk/tools
  $HOME/Library/Android/sdk/tools/bin

  # PNPM
  $HOME/Library/pnpm

  # Existing Path
  $path
)

# Export specific variables
export GROOVY_HOME="$HOMEBREW_PREFIX/opt/groovy/libexec"
export ANDROID_HOME="$HOME/Library/Android/sdk"
export ANDROID_SDK_ROOT="$ANDROID_HOME"

# 5. TOOLS & LANGUAGES
# ------------------------------------------------------------------------------

## NVM (Lazy Loading)
export NVM_DIR="$HOME/.nvm"
load_nvm() {
  [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
  [ -s "$NVM_DIR/etc/bash_completion.d/nvm" ] && . "$NVM_DIR/etc/bash_completion.d/nvm"
  [ -f .nvmrc ] && [ -r .nvmrc ] && nvm use --silent
}
nvm_triggers=(nvm node npm npx yarn pnpm corepack)
for cmd in $nvm_triggers; do
  unalias $cmd 2>/dev/null || true
  eval "$cmd() { unset -f $nvm_triggers; load_nvm; $cmd \"\$@\" }"
done

# Bun (Conditional - fast check)
export BUN_INSTALL="$HOME/.bun"
[ -s "$BUN_INSTALL/_bun" ] && source "$BUN_INSTALL/_bun"

# PNPM Home
export PNPM_HOME="$HOME/Library/pnpm"

# Go & Rust
export GOPATH="$HOME/go"
[ -f "$HOME/.cargo/env" ] && . "$HOME/.cargo/env"

# Pipx & UV
if command -v pipx >/dev/null; then
  eval "$(register-python-argcomplete pipx)"
fi
if command -v uv >/dev/null; then
  eval "$(uv generate-shell-completion zsh)"
fi

# Ruby (rbenv - Dynamic)
if [ -d "$HOMEBREW_PREFIX/opt/rbenv/bin" ]; then
  eval "$(rbenv init - zsh)"
fi

# Java
alias javalts='export JAVA_HOME=$(/usr/libexec/java_home)'
alias java25='export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk-25.jdk/Contents/Home'
alias java23='export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk-23.jdk/Contents/Home'
alias java21='export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk-21.jdk/Contents/Home'

# ==============================================================================
# 🛑 STOP 🛑
# DO NOT ADD NEW INSTALLER PATHS BELOW THIS LINE
# ==============================================================================

# 6. PRIORITY OVERRIDES
# ------------------------------------------------------------------------------

# Google Cloud SDK
if [ -f "$HOME/google-cloud-sdk/path.zsh.inc" ]; then
  . "$HOME/google-cloud-sdk/path.zsh.inc"
fi
if [ -f "$HOME/google-cloud-sdk/completion.zsh.inc" ]; then
  . "$HOME/google-cloud-sdk/completion.zsh.inc"
fi

# Explicitly use Pyenv shim for Cloud SDK
export CLOUDSDK_PYTHON="$HOME/.pyenv/shims/python3"

# Pyenv initialization
export PYENV_ROOT="$HOME/.pyenv"
if command -v pyenv >/dev/null; then
  # Explicitly add shims to front of path
  path=($PYENV_ROOT/bin $path)

  eval "$(pyenv init --path)"
  eval "$(pyenv init -)"

  if pyenv root >/dev/null 2>&1; then
    alias brew='env PATH="${PATH//$(pyenv root)\/shims:/}" brew'
  fi
fi

# Syntax highlighting
if [ -f "$HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]; then
  source "$HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
fi

# bun completions
[ -s "/Users/stan/.bun/_bun" ] && source "/Users/stan/.bun/_bun"
