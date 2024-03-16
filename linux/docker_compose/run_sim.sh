#!/usr/bin/env bash
cd /home/mantaray/mantaray_docker/linux/docker_compose

sudo docker image ls | grep auv_sim 

read -p 'tag: ' tag
if [[ -z "$tag" ]]; then
    echo "Setting tag to 0"
    tag="0"
fi
echo "Running auv_sim:${tag}"

XAUTH=/tmp/.docker.xauth
CATKIN_WS=/home/mantaray/catkin_ws
XHOST=":0"

if [ ! -f $XAUTH ]
then
    xauth_list=$(xauth nlist :0 | sed -e 's/^..../ffff/')
    if [ ! -z "$xauth_list" ]
    then
        echo $xauth_list | xauth -f $XAUTH nmerge -
    else
        touch $XAUTH
    fi
    chmod a+r $XAUTH
fi

xhost +
#--mount type=bind,source="$(pwd)"/mantaray_rpi,target=${CATKIN_WS}/src/mantaray_rpi \

sudo docker run -it \
    -e DISPLAY=$DISPLAY \
    -e QT_X11_NO_MITSHM=1 \
    --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
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
