FROM ubuntu:latest

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
RUN apt-get update && apt-get install -y sudo \
  nodejs \
  npm

# Java packages
RUN apt-get update && apt-get install -y sudo \
  default-jdk \
  ant

# Web
RUN apt-get update && apt-get install -y sudo \
  grunt

# AWS
RUN curl "https://s3.amazonaws.com/aws-cli/awscli-bundle.zip" -o "awscli-bundle.zip"
RUN unzip awscli-bundle.zip
RUN sudo ./awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws
RUN rm awscli-bundle.zip

RUN locale-gen en_US.UTF-8

## Setup github access
ARG ssh_prv_key
ARG ssh_pub_key
# Authorize SSH Host
RUN mkdir -p /root/.ssh && \
    chmod 0700 /root/.ssh
# Add the keys and set permissions
RUN echo "$ssh_prv_key" > /root/.ssh/id_rsa && \
    echo "$ssh_pub_key" > /root/.ssh/id_rsa.pub && \
    chmod 600 /root/.ssh/id_rsa && \
    chmod 600 /root/.ssh/id_rsa.pub
COPY config /root/.ssh/

# terminal colors with xterm
# set the zsh theme
ENV ZSH_THEME agnoster
ENV TERM=screen-256color

# Install docker
RUN curl -fsSL https://get.docker.com -o get-docker.sh
RUN sudo sh get-docker.sh

# Install oh-my-zsh
RUN wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh || true
COPY .zshrc /root/
COPY common-aliases.sh /root/
COPY .gitconfig /root/

ENTRYPOINT [ "/bin/zsh" ]