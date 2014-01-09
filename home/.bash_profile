export PATH=/usr/local/bin:$PATH

# MND specific stuff
if [ -d ~/Projects/mnd ]; then
  eval "$(rbenv init -)"
  eval "$(~/Projects/mnd/bin/mnd init -)"

  function solr {
    cd ~/Projects/solr
    ./start.sh $1
    cd -
  }
fi

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

