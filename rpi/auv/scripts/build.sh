#!/usr/bin/env bash
cd /home/mantaray/catkin_ws
catkin build -DCMAKE_BUILD_TYPE=Release -DPYTHON_EXECUTABLE=/usr/bin/python3
cd -
