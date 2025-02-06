FROM ubuntu:24.04

ARG TARGETARCH

# Prepare the test machine.
RUN apt-get update && apt-get install -y zsh git vim curl ripgrep fd-find make gcc

RUN useradd -p "$(openssl passwd -1 123)" -ms /bin/bash zoee

RUN mkdir /home/zoee/dotfiles
COPY ./ /home/zoee/dotfiles
RUN chown -R zoee:zoee /home/zoee/dotfiles


# From here on we are doing the install steps that the user would do.
WORKDIR /home/zoee
USER zoee

# Install neovim
RUN mkdir -p ~/.local/share/
RUN curl -LO https://github.com/neovim/neovim/releases/download/v0.10.4/nvim-linux-${TARGETARCH}.tar.gz
RUN tar -C ~ -xzf nvim-linux-${TARGETARCH}.tar.gz
RUN mv ~/nvim-linux-${TARGETARCH}/ ~/.local/share/bob/
RUN mv ~/.local/share/bob/bin/ ~/.local/share/bob/nvim-bin/

# Symlink fd since it is called fdfind on Ubuntu
RUN mkdir -p ~/.local/bin
RUN ln -s $(which fdfind) ~/.local/bin/fd

# Install Oh My Zsh
RUN sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Symlink the dotfiles
WORKDIR /home/zoee/dotfiles
RUN bash bootstrap.sh

WORKDIR /home/zoee
ENTRYPOINT ["tail", "-f", "/dev/null"]
