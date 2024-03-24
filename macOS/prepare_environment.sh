#!/bin/bash
cd ~/catkin_ws && catkin_make
source devel/setup.bash
/start_tmux.sh

