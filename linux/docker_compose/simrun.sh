#!/usr/bin/env bash
cd /home/${USER}/mantaray_docker/linux/docker_compose

sudo docker image ls | grep auv_sim 

read -p 'tag: ' tag
if [[ -z "$tag" ]]; then
    echo "Setting tag to 0"
    tag="0"
fi
echo "Running auv_sim:${tag}"

XAUTH=/tmp/.docker.xauth
CATKIN_WS=/home/mantaray/catkin_ws
XHOST=":1"

sudo touch /tmp/.docker.xauth
sudo chmod a+rwx /tmp/.docker.xauth
# Generate the X11 authorization key
xauth nlist :0 | sed -e 's/^..../ffff/' | xauth -f /tmp/.docker.xauth nmerge -
xhost +
#--mount type=bind,source="$(pwd)"/mantaray_rpi,target=${CATKIN_WS}/src/mantaray_rpi \

sudo docker run -it \
    --name "dockers-sim-1" \
    -e DISPLAY=$DISPLAY \
    -e QT_X11_NO_MITSHM=1 \
    --gpus all \
    --volume="/tmp/.X11-unix:/tmp/.X11-unix" \
    -e XAUTHORITY=$XAUTH \
    --volume="$XAUTH:$XAUTH" \
    --mount type=bind,source="$(pwd)"/mantaray_xavier,target=${CATKIN_WS}/src/mantaray_xavier \
    --mount type=bind,source="$(pwd)"/USCAUVSim,target=${CATKIN_WS}/src/USCAUVSim \
    --mount type=bind,source="$(pwd)"/USCAUVSim/scripts,target=/home/mantaray/scripts \
    --net=host \
    --privileged \
    --runtime=nvidia \
    auv_sim:$tag \
    bash

cd - 
xhost -
docker rm dockers-sim-1
