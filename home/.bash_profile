# Paths
if [ -d ~/.rbenv ]; then
  export PATH="$HOME/.rbenv/bin:$PATH"
fi

if [ -f ~/.aliases ]; then
  . ~/.aliases
fi

if [ -f ~/.bash_prompt ]; then
  . ~/.bash_prompt
fi

# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && \
    [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
        eval "$("$BASE16_SHELL/profile_helper.sh")"

# Initialize node version manager
if [ -d ~/.nvm ]; then
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
fi

# Initialize pyenv
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

# Initialize ruby environment
if command -v rbenv 1>/dev/null 2>&1; then
  eval "$(rbenv init -)"
fi

if [ -d ~/.rvm ]; then
  [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
fi

# Add Aseprite to the path
if [ -d "/mnt/c/Program Files (x86)/Steam/steamapps/common/Aseprite" ]; then
  export PATH="/mnt/c/Program Files (x86)/Steam/steamapps/common/Aseprite:$PATH"
fi

# Add Rancher Desktop to path
if [ -d ~/.rd ]; then
  export PATH="$HOME/.rd/bin:$PATH"
fi
