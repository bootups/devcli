#!/bin/zsh

cd /home/adrianb/projects/codelytics-design/devcli/docker

docker run --init -it --rm --user adrianb:adrianb -v $(realpath ../root):/home/adrianb:cached -v $(realpath ../../../codelytics-design):/project:cached -v /var/run/docker.sock:/var/run/docker.sock -p 9999:80 devcli


