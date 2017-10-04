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

# Customize to your needs...
if type "rbenv" > /dev/null; then
  eval "$(rbenv init -)"
fi

BASE16_SHELL="$HOME/.config/base16-shell/scripts/base16-tomorrow-night.sh"
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL

source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh

export NVM_DIR="/Users/zoee/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

export VISUAL=vim
export EDITOR=vim
export KEYTIMEOUT=1

# Aliases
alias ls="ls -Gla"
alias cddev="cd ~/Dropbox/dev"
alias sshz="ssh zoee@zoeetrope.com"
alias rmcc="find . -name \*\'s\ conflicted\ copy\ \* -exec mv -v {} ~/.Trash/ \;"

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

alias runtouch="ubuntu-html5-app-launcher --www=www --inspector"

# Settings for vi mode
bindkey -v

bindkey '^P' up-history
bindkey '^N' down-history
bindkey '^h' backward-delete-char
bindkey '^w' backward-kill-word
bindkey '^r' history-incremental-search-backward

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
