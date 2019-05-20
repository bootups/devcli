#!/bin/zsh

# TODO: Use Quick installation instructions instead: https://github.com/powerline/fonts
sudo apt-get install fonts-powerline

cd ../docker
docker build -f "Dockerfile" -t devcli:latest .

cd ../root
if [[ ! -a .oh-my-zsh ]]; then
    git clone --depth=1 https://github.com/robbyrussell/oh-my-zsh.git .oh-my-zsh
    cp -r ../docker/plugins/* .oh-my-zsh/custom/plugins/
fi
if [[ ! -a .ssh ]]; then
    cp -r ~/.ssh .
fi
if [[ ! -a .aws ]]; then
    cp -r ~/.aws .
fi
