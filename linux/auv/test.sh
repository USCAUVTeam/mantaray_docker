#!/usr/bin/env bash
cd /home/mantaray/mantaray_docker/linux/auv

sudo docker image ls | grep auv_real 

read -p 'tag: ' tag
if [[ -z "$tag" ]]; then
    echo "Setting tag to 0"
    tag="0"
fi
echo "Running auv_real:${tag}"

CATKIN_WS=/home/mantaray/catkin_ws

sudo docker run -it \
    --mount type=bind,source="$(pwd)"/mantaray_xavier,target=${CATKIN_WS}/src/mantaray_xavier \
    --mount type=bind,source="$(pwd)"/mantaray_rpi,target=$(CATKIN_WS)/src/mantaray_rpi \
    --net=host \
    --privileged \
    auv_real:$tag \
    bash

cd - 
