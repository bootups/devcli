#!/bin/zsh

cd ../docker
docker build \
    --build-arg ssh_prv_key="$(cat ~/.ssh/id_rsa)" \
    --build-arg ssh_pub_key="$(cat ~/.ssh/id_rsa.pub)" \
    --build-arg ssh_known_hosts="$(cat ~/.ssh/known_hosts)" \
    --build-arg aws_config="$(cat ~/.aws/config)" \
    --build-arg aws_credentials="$(cat ~/.aws/credentials)" \
    -f "Dockerfile" \
    -t cli:latest .
