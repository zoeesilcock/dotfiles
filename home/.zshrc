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

# Source zsh-git-prompt
source ~/dotfiles/home/zsh-git-prompt/zshrc.sh
ZSH_THEME_GIT_PROMPT_BRANCH="%{$fg_bold[green]%}"
ZSH_THEME_GIT_PROMPT_STAGED="%{$fg[red]%}%{*%G%}"
ZSH_THEME_GIT_PROMPT_CONFLICTS="%{$fg[red]%}%{x%G%}"
ZSH_THEME_GIT_PROMPT_CHANGED="%{$fg[blue]%}%{+%G%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg_bold[green]%}%{=%G%}"
PROMPT='%* %{$fg[green]%}%~%b%{$reset_color%} $(git_super_status) $ '

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
alias respec="bundle exec rspec -f d"
