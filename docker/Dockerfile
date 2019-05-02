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

# terminal colors with xterm
# set the zsh theme
ENV ZSH_THEME agnoster
ENV TERM=screen-256color

# Install docker
RUN curl -fsSL https://get.docker.com -o get-docker.sh
RUN sudo sh get-docker.sh

# Gives good examples of linux commands
RUN ln -s /devcli/cache/.tldr /root/.tldr
RUN ln -s /devcli/cache/.z /root/.z
RUN npm install -g tldr

# Install oh-my-zsh
RUN wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh || true
COPY .zshrc /root/
COPY common-aliases.sh /root/
COPY .gitconfig /root/
COPY plugins /root/.oh-my-zsh/custom/plugins/

# Setup github access
ARG ssh_prv_key
ARG ssh_pub_key
ARG ssh_known_hosts
RUN mkdir -p /root/.ssh && \
    chmod 0700 /root/.ssh
RUN echo "$ssh_prv_key" > /root/.ssh/id_rsa && \
    echo "$ssh_pub_key" > /root/.ssh/id_rsa.pub && \
    echo "$ssh_known_hosts" > /root/.ssh/known_hosts && \
    chmod 600 /root/.ssh/id_rsa && \
    chmod 600 /root/.ssh/id_rsa.pub
COPY config /root/.ssh/

# Setup aws credentials
ARG aws_config
ARG aws_credentials
RUN mkdir -p /root/.aws && \
    chmod 0700 /root/.aws
RUN echo "$aws_config" > /root/.aws/config && \
    echo "$aws_credentials" > /root/.aws/credentials && \
    chmod 600 /root/.aws/config && \
    chmod 600 /root/.aws/credentials

ARG home
ENV HOST_HOME="$home"

ENTRYPOINT [ "/bin/zsh" ]
