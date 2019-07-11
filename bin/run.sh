#!/bin/zsh

scriptdir=$0:a:h

#Ubuntu is missing the following
#      -v /etc/timezone:/etc/timezone:ro -v /etc/localtime:/etc/localtime:ro \

cd $scriptdir/../docker
docker run --init -it -P --rm \
    --user $(whoami):$(whoami) \
    -v $(realpath ../root):/home/$(whoami)-env1:cached \
    -v /Users/$(whoami):/home/$(whoami):cached \
    -v /var/run/docker.sock:/var/run/docker.sock \
    devcli