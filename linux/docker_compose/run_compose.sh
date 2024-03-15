#!/usr/bin/env bash
xhost +
cd ~/mantaray_docker/linux/auv/dockers
docker compose up
xhost -
