#!/usr/bin/env bash
xhost +
cd ~/mantaray_docker/linux/docker_compose/dockers
docker compose up
xhost -
