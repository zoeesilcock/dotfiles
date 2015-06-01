set fish_greeting

set --universal fish_user_paths "/usr/local/bin" "/usr/local/heroku/bin" $fish_user_paths

set -xg EDITOR vim
set -xg RBENV_ROOT /usr/local/var/rbenv
. (rbenv init -|psub)

. "$HOME/.config/fish/functions/aliases.fish"
. "$HOME/.config/fish/functions/mnd.fish"
