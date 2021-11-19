FROM ubuntu:20.04

# Prepare the test machine.
RUN apt-get update && apt-get install -y zsh git vim curl

RUN useradd -p "$(openssl passwd -1 123)" -ms /bin/bash zoee

RUN mkdir /home/zoee/dotfiles
COPY ./ /home/zoee/dotfiles
RUN chown -R zoee:zoee /home/zoee/dotfiles


# From here on we are doing the install steps that the user would do.
WORKDIR /home/zoee/dotfiles
USER zoee

RUN git submodule init
RUN git submodule update

RUN sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
RUN bash bootstrap.sh

WORKDIR /home/zoee
ENTRYPOINT ["tail", "-f", "/dev/null"]
