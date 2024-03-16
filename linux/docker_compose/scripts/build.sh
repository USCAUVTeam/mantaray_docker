#!/usr/bin/env bash
cd ~/catkin_ws

catkin build -DCMAKE_BUILD_TYPE=Release -DPYTHON_EXECUTABLE=/usr/bin/python3

cd -
