#!/bin/zsh

cd ..
currentUid=$(id -u $(whoami))
currentGid=$(id -g $(whoami))
docker build -f "Dockerfile" --build-arg whoami=$(whoami) --build-arg dockerGid=$dockerGid --build-arg currentUid=$currentUid  --build-arg currentGid=$currentGid -t devcli:latest .

cd ~
if [[ ! -a .oh-my-zsh ]]; then
    git clone --depth=1 https://github.com/robbyrussell/oh-my-zsh.git .oh-my-zsh
fi
if [[ ! -a .oh-my-zsh/custom/plugins/k ]]; then
    git clone --depth=1 git@github.com:supercrabtree/k.git .oh-my-zsh/custom/plugins/k
fi
if [[ ! -a .oh-my-zsh/custom/plugins/zsh-autosuggestions ]]; then
    git clone --depth=1 git@github.com:zsh-users/zsh-autosuggestions.git .oh-my-zsh/custom/plugins/zsh-autosuggestions
fi
if [[ ! -a .oh-my-zsh/custom/plugins/zsh-completions ]]; then
    git clone --depth=1 git@github.com:zsh-users/zsh-completions.git .oh-my-zsh/custom/plugins/zsh-completions
fi
if [[ ! -a .oh-my-zsh/custom/plugins/zsh-syntax-highlighting ]]; then
    git clone --depth=1 git@github.com:zsh-users/zsh-syntax-highlighting.git .oh-my-zsh/custom/plugins/zsh-syntax-highlighting
fi