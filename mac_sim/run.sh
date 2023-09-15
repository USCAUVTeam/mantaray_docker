#!/usr/bin/env bash

CATKIN_WS=/home/mantaray/catkin_ws

cd ~/mantaray_docker/auv

sudo docker run -p 6080:80 -v /dev/shm:/dev/shm \
    --mount type=bind,source="$(pwd)"/mantaray_xavier,target=${CATKIN_WS}/src/mantaray_xavier \
    --mount type=bind,source="$(pwd)"/mantaray_rpi,target=${CATKIN_WS}/src/mantaray_rpi \
    --mount type=bind,source="$(pwd)"/USCAUVSim,target=${CATKIN_WS}/src/USCAUVSim \
    --mount type=bind,source="$(pwd)"/USCAUVSim/scripts,target=/home/mantaray/scripts \
    --mount type=bind,source="$(pwd)"/../mac_sim/scripts,target=/root/Desktop/scripts \
    mac_auv:v0

cd - 
