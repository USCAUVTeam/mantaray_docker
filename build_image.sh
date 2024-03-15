#!/usr/bin/env bash
read -p 'tag: ' tag
if [[ -z "$tag" ]]; then
    echo "Setting tag to 0"
    tag="0"
fi
echo "Building to auv_sim:${tag}"
sudo docker build -t auv_sim:$tag linux/docker_compose/.
