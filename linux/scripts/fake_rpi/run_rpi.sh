#!/usr/bin/env bash
cd /home/${USER}/mantaray_docker/linux/src

sudo docker image ls | grep auv_rpi

read -p 'tag: ' tag
if [[ -z "$tag" ]]; then
    echo "Setting tag to 0"
    tag="0"
fi
echo "Running auv_rpi:${tag} on Desktop"

CATKIN_WS=/home/mantaray/catkin_ws

sudo docker run -it \
    --mount type=bind,source="$(pwd)"/control-toolbox,target=${CATKIN_WS}/src/control-toolbox \
    --mount type=bind,source="$(pwd)"/mantaray_xavier,target=${CATKIN_WS}/src/mantaray_xavier \
    --mount type=bind,source="$(pwd)"/kindr,target=${CATKIN_WS}/src/kindr \
    --mount type=bind,source="$(pwd)"/mantaray_hardware,target=${CATKIN_WS}/src/mantaray_hardware \
    --mount type=bind,source="$(pwd)"/AUVUtils,target=${CATKIN_WS}/src/AUVUtils \
    --mount type=bind,source="$(pwd)"/mantaray_xavier/docker_scripts,target=/home/mantaray/scripts \
    --net=host \
    --privileged \
    --name auv_rpi \
    auv_rpi:$tag \
    bash

cd - 
