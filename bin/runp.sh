#!/bin/zsh

cd ../docker

#docker run --name cli -v ~/Projects:/projects cli /bin/zsh

docker run --init -it --rm -v $PWD:/work:cached -p 8000:8000 cli