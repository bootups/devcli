FROM ubuntu:latest

RUN echo "Set disable_coredump false" >> /etc/sudo.conf

# Install manpages
RUN yes | unminimize && \
    apt-get install -y man-db && \
    rm -r /var/lib/apt/lists/*

# Core
RUN apt-get update && apt-get install -y sudo \
  zsh \
  curl \
  fonts-powerline

# Tools
RUN apt-get update && apt-get install -y sudo \
  ssh \
  wget \
  zip \
  neovim

# Git
RUN apt-get update && apt-get install -y sudo \
  git-core

# Node
RUN apt-get update && apt-get install -y curl software-properties-common
RUN curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
RUN apt-get update && apt-get install -y sudo \
  nodejs

# Java packages
#RUN apt-get update && apt-get install -y sudo \
#  default-jdk \
#  ant

# Web
RUN apt-get update && apt-get install -y sudo \
  grunt
RUN npm install http-server -g

RUN apt-get update && apt-get install -y sudo
RUN apt-get install software-properties-common
RUN add-apt-repository ppa:deadsnakes/ppa
RUN apt-get update
RUN apt-get install -y python3.7

# AWS CLI
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
RUN unzip awscliv2.zip
RUN sudo ./aws/install
RUN rm awscliv2.zip

# Setup locale so characters work correctly
RUN apt-get update && apt-get -y install locales
RUN locale-gen en_US.UTF-8

# terminal colors with xterm
# set the zsh theme
ENV ZSH_THEME agnoster
ENV TERM=screen-256color

# Install docker
RUN apt-get update && apt-get install -y sudo \
  docker.io

# Gives good examples of linux commands
RUN npm install -g tldr

ARG whoami
ARG currentUid
ARG currentGid
RUN groupdel dialout
RUN addgroup --gid "$currentGid" "$whoami"
RUN addgroup --gid 80 admin
# todo: get rid of unnecessary gids
RUN adduser --uid "$currentUid" --gid 0 --gid 1 --gid 80 --gid "$currentGid" --disabled-password  --gecos "" "$whoami"
RUN echo ""$whoami":password"|sudo chpasswd
RUN usermod -a -G sudo "$whoami"
RUN usermod -a -G docker "$whoami"
# Change default user location, so that the user can access their Users folder
# with the same path as the host
ARG home
RUN usermod -d "$home" "$whoami"
RUN sudo mkdir -p "$home"

USER "$whoami"

ENTRYPOINT [ "/bin/zsh" ]