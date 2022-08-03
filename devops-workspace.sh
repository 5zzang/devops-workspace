#!/bin/bash

docker run \
    -it \
    -u root \
    --entrypoint fish  \
    --rm \
    -e "ANSIBLE_VAULT_PASSWORD_FILE=~/.vault_pass.txt" \
    -e "AWS_DEFAULT_REGION=ap-southeast-1" \
    -v $HOME/.aws:/root/.aws \
    -v $HOME/.ssh:/root/.ssh \
    -v $HOME/.gradle:/root/.gradle \
    -v $HOME/.m2:/root/.m2 \
    -v $HOME/.ansible/.vault_pass.txt:/root/.vault_pass.txt \
    -v $HOME/git:/data \
	--name devops-workspace \
    devops-workspace:latest
