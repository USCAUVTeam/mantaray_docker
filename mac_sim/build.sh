#!/usr/bin/env bash
cd ~/mantaray_docker
read -p 'tag: ' tag
if [[ -z "$tag" ]]; then
    echo "Setting tag to v0"
    tag="v0"
fi
echo "Building to mac_auv:${tag}"
sudo docker build -t mac_auv:$tag mac_sim/.
cd -
