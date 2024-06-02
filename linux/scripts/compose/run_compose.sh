#!/usr/bin/env bash
xhost +
cd ~/mantaray_docker/linux/dockers
docker compose up
xhost -
