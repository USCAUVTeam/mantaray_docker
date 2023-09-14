#!/usr/bin/env bash
cd ~/mantaray_docker
read -p 'tag: ' tag
if [[ -z "$tag" ]]; then
    echo "Setting tag to 0"
    tag="0"
fi
echo "Building to auv:${tag}"
sudo docker build -t auv:$tag auv/.
cd -
