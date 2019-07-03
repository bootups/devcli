#!/bin/zsh

scriptdir=$0:a:h

cd $scriptdir/../docker
docker run --init -it -P --rm \
    --user $(whoami):$(whoami) \
    -v $(realpath ../root):/home/$(whoami)-env1:cached \
    -v /home/$(whoami):/home/$(whoami):cached \
    -v /etc/timezone:/etc/timezone:ro -v /etc/localtime:/etc/localtime:ro \
    -v /var/run/docker.sock:/var/run/docker.sock \
    devcli