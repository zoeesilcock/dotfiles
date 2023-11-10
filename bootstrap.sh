#!/bin/bash

echo "Installing vim-plug"
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

function symlink {
  ln -nsf $1 $2
}

function md5_command {
  if hash md5 2>/dev/null; then
    md5 $1
  elif hash md5sum 2>/dev/null; then
    md5sum $1
  fi
}

for file in home/.[^.]*; do
  path="$(pwd)/$file"
  base=$(basename $file)
  target="$HOME/$base"

  if [[ $path == *".swp"* ]]; then
    continue
  fi

  if [[ $path == *".config"* ]]; then
    continue
  fi

  if [[ -h $target && ($(readlink $target) == $path)]]; then
    echo "~/$base is symlinked to $path"
  elif [[ -f $target && $(md5_command $path) == $(md5_command $target) ]]; then
    echo "~/$base exists and is identical. Overriding"
    symlink $path $target
  elif [[ -a $target ]]; then
    read -p "~/$base exists and differs from $path. Override? [yn]" -n 1

    if [[ $REPLY =~ [yY]* ]]; then
      symlink $path $target
    fi
  else
    echo "~/$base does not exist. Symlinking"
    symlink $path $target
  fi
done

if [ ! -L "$HOME/.config/base16-shell" ]; then
  if [ -d "$HOME/.config/base16-shell" ]; then
    rm -rf "$HOME/.config/base16-shell"
  fi
  mkdir -p "$HOME/.config"

  echo "linking base16-shell"
  symlink "$(pwd)/home/base16-shell" "$HOME/.config/base16-shell"
  symlink "$HOME/.config/base16-shell/scripts/base16-tomorrow-night.sh" "$HOME/.base16_theme"
fi

symlink "$(pwd)/home/.zsh_prompt" "$HOME/.oh-my-zsh/custom/themes/zoees.zsh-theme"
symlink "$(pwd)/home/.config/nvim" "$HOME/.config/nvim"
symlink "$(pwd)/home/.config/nvim-vscode" "$HOME/.config/nvim-vscode"

echo "Installing VIM plugins"
vim --not-a-term +'PlugInstall --sync' +qa
