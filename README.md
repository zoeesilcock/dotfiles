# Zoee's dotfiles

## Installation

Clone the repo into the home directory and run the bootstrap.sh script.

```
git submodule init
git submodule update
bash bootstrap.sh
```

## Dependencies
* md5 or md5sum
* curl
* vim
* Oh My Zsh (if you are using zsh)

For vim to look right you will also need to install a powerline version of Fira Mono from [here](https://github.com/powerline/fonts).

## Development
```
skaffold dev

# Try out bash
kubectl exec -it dotfiles-test-machine -- /bin/bash

# Try out zsh
kubectl exec -it dotfiles-test-machine -- /usr/bin/zsh
```
