#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
# Thanks to michaeljsmalley and teoljungberg.
############################

########## Variables

dir=~/dotfiles/home               # dotfiles directory
olddir=~/dotfiles_old             # old dotfiles backup directory

##########

# create dotfiles_old in homedir
echo -n "Creating $olddir for backup of any existing dotfiles in ~ ..."
mkdir -p $olddir
echo "done"

# change to the dotfiles directory
echo -n "Changing to the $dir directory ..."
cd $dir
echo "done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks from the homedir to any files in the ~/dotfiles directory specified in $files
for file in .[^.]*; do
  file_name=$(basename $file)
  echo "Moving any existing dotfiles from ~ to $olddir"
  cp -r ~/$file_name ~/dotfiles_old/
  echo "Creating symlink to $file_name in home directory."
  ln -nsf $dir/$file_name ~/$file_name
done