#!/bin/zsh

cd /home/adrianb/projects/codelytics-design/devcli/docker
docker run --init -it --rm \
    --user adrianb:adrianb \
    -v $(realpath ../root):/home/adrianb-env1:cached \
    -v /home/adrianb:/home/adrianb:cached \
    -v /etc/timezone:/etc/timezone:ro -v /etc/localtime:/etc/localtime:ro \
    -v /var/run/docker.sock:/var/run/docker.sock \
    devcli