#!/bin/zsh

cd ../docker

# pwd example
#docker run --init -it --rm -v $PWD:/Users:cached -v /var/run/docker.sock:/var/run/docker.sock cli

docker run --init -it --rm -v /Users:/Users:cached -v /var/run/docker.sock:/var/run/docker.sock cli
