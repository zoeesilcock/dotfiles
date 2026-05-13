if [ -r /etc/os-release ] && [ "$(. /etc/os-release; echo $NAME)" = "Ubuntu" ]; then
  . ~/.bash_profile
fi
