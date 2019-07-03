#!/bin/zsh

cd ../docker
dockerGid=$(python -c 'import grp; print grp.getgrnam("docker").gr_gid')
currentUid=$(id -u $(whoami))
currentGid=$(id -g $(whoami))
docker build -f "Dockerfile" --build-arg whoami=$(whoami) --build-arg dockerGid=$dockerGid --build-arg currentUid=$currentUid  --build-arg currentGid=$currentGid -t devcli:latest .

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
