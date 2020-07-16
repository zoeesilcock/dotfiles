FROM ubuntu:20.04

# Prepare the test machine.
RUN apt-get update && apt-get install -y git vim curl

RUN useradd -ms /bin/bash zoee

RUN mkdir /home/zoee/dotfiles
COPY ./ /home/zoee/dotfiles
RUN chown -R zoee:zoee /home/zoee/dotfiles


# From here on we are doing the install steps that the user would do.
WORKDIR /home/zoee/dotfiles
USER zoee

RUN git submodule init
RUN git submodule update
RUN bash bootstrap.sh

WORKDIR /home/zoee
ENTRYPOINT ["tail", "-f", "/dev/null"]
