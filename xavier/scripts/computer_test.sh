#!/usr/bin/env bash

rostopic pub -1 /mantaray/thrusters/0/input uuv_gazebo_ros_plugins_msgs/FloatStamped -- '
{
header: {seq: 13000, stamp: now},
data: 100
}'
