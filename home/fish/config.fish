set fish_greeting

set -xg EDITOR vim
set -xg RBENV_ROOT /usr/local/var/rbenv
. (rbenv init -|psub)

. "$HOME/.config/fish/functions/paths.fish"
. "$HOME/.config/fish/functions/aliases.fish"
. "$HOME/.config/fish/functions/mnd.fish"
