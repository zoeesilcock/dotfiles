#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...
eval "$(rbenv init -)"

# Aliases
alias ls="ls -Gla"
alias cddev="cd ~/Dropbox/dev"
alias sshz="ssh zoee@zoeetrope.com"

alias gs="git status "
alias ga="git add "
alias gb="git branch "
alias gc="git commit"
alias gd="git diff"
alias gco="git checkout "
alias gss="git stash"
alias gsp="git stash pop"
alias gp="git push"
alias gpr="git pull --rebase"
alias gk="gitk --all&"
alias gx="gitx --all"
alias got="git "
alias gut="git "

alias b="bundle exec"
alias brake="bundle exec rake"
