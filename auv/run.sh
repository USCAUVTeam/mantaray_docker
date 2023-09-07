#!/usr/bin/env bash
cd ~/mantaray_docker/auv

XAUTH=/tmp/.docker.xauth
CATKIN_WS=/home/mantaray/catkin_ws
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

sudo docker run -it \
    --env="DISPLAY=$DISPLAY" \
    --env="QT_X11_NO_MITSHM=1" \
    --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
    --env="XAUTHORITY=$XAUTH" \
    --volume="$XAUTH:$XAUTH" \
    --mount type=bind,source="$(pwd)"/mantaray_xavier,target=${CATKIN_WS}/src/mantaray_xavier \
    --mount type=bind,source="$(pwd)"/mantaray_rpi,target=${CATKIN_WS}/src/mantaray_rpi \
    --mount type=bind,source="$(pwd)"/USCAUVSim,target=${CATKIN_WS}/src/USCAUVSim \
    --mount type=bind,source="$(pwd)"/USCAUVSim/scripts,target=/home/mantaray/scripts \
    --net=host \
    auv:v1 \
    bash
    # --runtime=nvidia \
    #--privileged \
    #--gpus 'all,capabilities=utility' \
    #auv:v0 \
    #bash

cd - 
xhost -
