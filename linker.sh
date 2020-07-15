#!/bin/bash

function symlink {
  ln -nsf $1 $2
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
  elif [[ -f $target && $(md5 $path) == $(md5 $target) ]]; then
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
fi
