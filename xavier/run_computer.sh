#!/usr/bin/env bash

NAME="xavier_computer"
XAUTH=/tmp/.docker.xauth
HOME=/home/mantaray
CATKIN_WS=${HOME}/catkin_ws

echo "running code for the xavier on the computer..."

cd ~/mantaray_docker/xavier

sudo docker image ls | grep $NAME

read -p 'tag: ' tag
if [[ -z "$tag" ]]; then
    echo "Setting tag to v0"
    tag="v0"
fi
echo "Running ${NAME}:${tag}"

sudo docker run -it \
    --mount type=bind,source="$(pwd)"/mantaray_xavier,target=${CATKIN_WS}/src/mantaray_xavier \
    --mount type=bind,source="$(pwd)"/AUVUtils,target=${CATKIN_WS}/src/auAUVUtils \
    --mount type=bind,source="$(pwd)"/scripts,target=${HOME}/scripts \
    --privileged \
    --gpus 'all,capabilities=utility' \
    ${NAME}:${tag} \
    bash

cd -