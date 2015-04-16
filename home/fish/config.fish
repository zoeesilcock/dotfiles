set fish_greeting

set -xg PATH "/user/local/bin" "/usr/local/heroku/bin" $PATH

set -xg EDITOR vim
set -xg RBENV_ROOT /usr/local/var/rbenv
. (rbenv init -|psub)

. "$HOME/.config/fish/functions/aliases.fish"
. "$HOME/.config/fish/functions/mnd.fish"
