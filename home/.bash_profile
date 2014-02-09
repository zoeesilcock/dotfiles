export PATH=/usr/local/bin:$PATH

if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

if [ -f $(brew --prefix)/etc/bash_completion.d/git-prompt.sh ]; then
  . $(brew --prefix)/etc/bash_completion.d/git-prompt.sh
fi

if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi

if [ -f ~/.bash_prompt ]; then
  . ~/.bash_prompt
fi

# Initialize ruby environment
if [ -d ~/.rbenv ]; then
  eval "$(rbenv init -)"
fi

if [ -d ~/.rvm ]; then
  [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
fi

# MND specific stuff
if [ -d ~/Projects/mnd ]; then
  eval "$(~/Projects/mnd/bin/mnd init -)"
fi

if [ -d ~/Projects/solr ]; then
  function solr {
    cd ~/Projects/solr
    ./start.sh $1
    cd -
  }
fi
