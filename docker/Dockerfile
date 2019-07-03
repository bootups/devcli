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
RUN apt-get update && apt-get install -y curl software-properties-common
RUN curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
RUN apt-get update && apt-get install -y sudo \
  nodejs

# Java packages
RUN apt-get update && apt-get install -y sudo \
  default-jdk \
  ant

# Web
RUN apt-get update && apt-get install -y sudo \
  grunt
RUN npm install http-server -g

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
ARG dockerGid
RUN addgroup --gid "$dockerGid" docker
RUN curl -fsSL https://get.docker.com -o get-docker.sh
RUN sudo sh get-docker.sh

# Gives good examples of linux commands
RUN npm install -g tldr

ARG whoami
ARG currentUid
ARG currentGid
RUN addgroup --gid "$currentGid" "$whoami"
RUN adduser --uid "$currentUid" --gid "$currentGid" --gid "$dockerGid" --disabled-password  --gecos "" "$whoami"
RUN echo ""$whoami":password"|sudo chpasswd
RUN usermod -aG sudo "$whoami"
# Change default user location, so that the user can access their home folder
# with the same path as the host
RUN usermod -d /home/"$whoami"-env1 "$whoami"
RUN sudo rm -rf /home/"$whoami"
RUN sudo mkdir /home/"$whoami"-env1
RUN sudo chown "$whoami" /home/"$whoami"-env1
USER "$whoami"

# Setup github access
ARG ssh_prv_key
ARG ssh_pub_key
ARG ssh_known_hosts
RUN mkdir -p ~/.ssh && \
    chmod 0700 ~/.ssh
RUN echo "$ssh_prv_key" > ~/.ssh/id_rsa && \
    echo "$ssh_pub_key" > ~/.ssh/id_rsa.pub && \
    echo "$ssh_known_hosts" > ~/.ssh/known_hosts && \
    chmod 600 ~/.ssh/id_rsa && \
    chmod 600 ~/.ssh/id_rsa.pub

# Setup aws credentials
ARG aws_config
ARG aws_credentials
RUN mkdir -p ~/.aws && \
    chmod 0700 ~/.aws
RUN echo "$aws_config" > ~/.aws/config && \
    echo "$aws_credentials" > ~/.aws/credentials && \
    chmod 600 ~/.aws/config && \
    chmod 600 ~/.aws/credentials

EXPOSE 8080 

ENTRYPOINT [ "/bin/zsh" ]