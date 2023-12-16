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
* [Oh My Zsh](https://ohmyz.sh/#install)

## Additional software
* [Fira Mono for Powerline font](https://github.com/powerline/fonts)
* [Fira Mono Nerdfont](https://www.nerdfonts.com/font-downloads)
* [NVM](https://github.com/nvm-sh/nvm)
* [RVM](https://rvm.io/rvm/install)
* [Timetrap](https://github.com/samg/timetrap)
* [Bob](https://github.com/MordechaiHadad/bob)
* Neovim 0.9.x+

## Development
```
skaffold dev

# Try out bash
kubectl exec -it dotfiles-test-machine -- /bin/bash

# Try out zsh
kubectl exec -it dotfiles-test-machine -- /usr/bin/zsh
```
