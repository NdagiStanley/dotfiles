export SHELL=bash

# Load dotfiles
for file in ~/.{path,aliases,bash_prompt,functions}; do
    [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

# Over-ride ZSH reload
# Reload the shell (i.e. invoke as a login shell)
alias reload="exec $SHELL -l"

# Easier navigation
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

# Git
alias gst="g status"
alias gcmsg="g commit -m"
