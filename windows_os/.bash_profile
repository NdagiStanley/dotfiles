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
alias gst="git status"
alias gcmsg="git commit -m"
alias gaa="git add ."
alias gco="git checkout"
alias gd="git diff"

git_current_branch() {
    git rev-parse --abbrev-ref HEAD
}
alias ggpull='git pull origin "$(git_current_branch)"'
alias ggpush='git push origin "$(git_current_branch)"'
alias gca!="git commit -v -a --amend"
alias gcan!="git commit -v -a --no-edit --amend"
