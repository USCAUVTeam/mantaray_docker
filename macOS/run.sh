#!/usr/bin/env bash

: '
Ask if they are in the base directory of mantaray_docker

if [[$# < 1]]; then
	echo "You need to specify either macOS, windows, or linux!"
	echo "For example, run "./run.sh macOS" if you are on MacOS with Apple Silicon"
elif [[
'

docker run -it \
--mount type=bind,source="$(pwd)"/../ros_tutorials,target=/home/mantaray/catkin_ws/src/ros_tutorial \
--mount type=bind,source="$(pwd)"/../auv,target=/home/mantaray/auv \
auv_ros_tutorial:0
