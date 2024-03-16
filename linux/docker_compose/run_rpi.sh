#!/usr/bin/env bash
cd /home/mantaray/mantaray_docker/linux/docker_compose

sudo docker image ls | grep auv_real 

read -p 'tag: ' tag
if [[ -z "$tag" ]]; then
    echo "Setting tag to 0"
    tag="0"
fi
echo "Running auv_real:${tag}"

CATKIN_WS=/home/mantaray/catkin_ws

sudo docker run -it \
    --mount type=bind,source="$(pwd)"/control-toolbox,target=${CATKIN_WS}/src/control-toolbox \
    --mount type=bind,source="$(pwd)"/mantaray_rpi,target=${CATKIN_WS}/src/mantaray_rpi \
    --mount type=bind,source="$(pwd)"/kindr,target=${CATKIN_WS}/src/kindr \
    --mount type=bind,source="$(pwd)"/scripts,target=/home/mantaray/scripts \
    --net=host \
    --privileged \
    auv_real:$tag \
    bash

cd - 
