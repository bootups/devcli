#!/bin/zsh

cd ../docker

docker run --init -it --rm -v $(realpath ../root):/root:cached -v $(realpath ../../../codelytics-design):/project:cached -v /var/run/docker.sock:/var/run/docker.sock -p 9999:80 devcli
