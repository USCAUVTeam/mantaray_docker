#!/usr/bin/env bash
cd /home/${USER}/mantaray_docker/
read -p 'tag: ' tag
if [[ -z "$tag" ]]; then
    echo "Setting tag to 0"
    tag="0"
fi
echo "Building to auv_xavier:${tag}"
sudo docker build -t auv_xavier:$tag linux/dockers/xavier
cd -
