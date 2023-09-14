#!/usr/bin/env bash
NAME="xavier_computer"
read -p 'tag: ' tag
if [[ -z "$tag" ]]; then
    echo "Setting tag to v0"
    tag="v0"
fi
echo "Building to ${NAME}:${tag}"
sudo docker build -t ${NAME}:${tag} computer/.
