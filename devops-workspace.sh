#!/bin/bash

sudo docker run \
    -it \
    -u root \
    --entrypoint zsh  \
    --rm \
    -e "ANSIBLE_VAULT_PASSWORD_FILE=~/.vault_pass.txt" \
    -e "AWS_DEFAULT_REGION=ap-southeast-1" \
    -v $HOME/.aws:/root/.aws \
    -v $HOME/.ssh:/root/.ssh \
    -v $HOME/.m2:/root/.m2 \
    -v $HOME/.ansible/.vault_pass.txt:/root/.vault_pass.txt \
    -v $HOME/git:/git \
   	--name devops-workspace \
    devops-workspace:latest
