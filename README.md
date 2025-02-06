# Zoee's dotfiles

## Installation

Clone the repo into the home directory and run the bootstrap.sh script.

```
bash bootstrap.sh
```

## Dependencies
* md5 or md5sum
* curl
* [Oh My Zsh](https://ohmyz.sh/#install)

## Additional software
* [NVM](https://github.com/nvm-sh/nvm)
* [RVM](https://rvm.io/rvm/install)
* [Timetrap](https://github.com/samg/timetrap)
* Neovim 0.9.x+
  * [Fira Mono Nerdfont](https://www.nerdfonts.com/font-downloads)
  * [Bob](https://github.com/MordechaiHadad/bob)
  * [Ripgrep](https://github.com/BurntSushi/ripgrep)
  * [fd](https://github.com/sharkdp/fd)
* vim (deprecated)
  * [vim-plug](https://github.com/junegunn/vim-plug)
  * [Fira Mono for Powerline font](https://github.com/powerline/fonts)

## Development
```
skaffold dev

# Try out bash
kubectl exec -it dotfiles-test-machine -- /bin/bash

# Try out zsh
kubectl exec -it dotfiles-test-machine -- /usr/bin/zsh
```
