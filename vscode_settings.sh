#!/bin/bash

if [[ $# -eq 1 && $1 == "backup" ]];
then
  cp ~/Library/Application\ Support/Code/User/settings.json ./vscode/settings.json
  echo "VS Code settings backed up"
elif [[ $# -eq 1 && $1 == "restore" ]];
then
  cp ./vscode/settings.json ~/Library/Application\ Support/Code/User/settings.json
  echo "VS Code settings restored"
else
  echo "Accepts 'backup' or 'restore' as an argument."
fi

