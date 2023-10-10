#!/usr/bin/env bash
cd ~/mantaray_docker
echo "Warning: Default tag for run_image.sh is v0!"
read -p 'tag: ' tag
if [[ -z "$tag" ]]; then
    echo "Setting tag to v0"
    tag="v0"
fi
echo "Building to auv:${tag}"
sudo docker build -t auv:$tag auv/.
cd -
