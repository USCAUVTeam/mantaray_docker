# Getting Started

Prerequisites: Before cloning the repo, try to get Git installed on your machine and set up so that you can clone things via SSH. Follow the links below to see how to do this. You should also get VSCode installed if you don't have it already.

Steps for MacOS:

1. Clone the Repo and its submodules to your main directory

   ```
   cd ~
   git clone git@github.com:USCAUVTeam/mantaray_docker.git
   cd mantaray_docker
   git checkout ros_totorial
   ```
2. Modify files so that it can build properly later on

   ```
   cd ~/mantaray_docker
   git submodule init
   git submodule update --recursive
   cd ~/mantaray_docker/ros_tutorials
   git checkout melodic-devel
   rm -rf turtlesim
   ```
3. Give permissions to bash scripts:

   ```
   cd ~/mantaray_docker
   chmod +x ./macOS/*
   ```
4. Pull the docker image and then Build the docker image:

   ```
   sudo docker pull ros:melodic
   cd ~/mantaray_docker/macOS
   ./build.sh
   ```
5. Run docker container:

   ```
   cd ~/mantaray_docker/macOS
   ./run.sh
   ```
6. Use VSCode to modify and run ROS Code

## Important Links

- https://github.com/USCAUVTeam/mantaray_docker/tree/ros_totorial
- Basics for MacOS
  - Homebrew: https://docs.brew.sh/Installation
  - Install Git via Homebrew: https://git-scm.com/download/mac
- Getting Github Set Up:
  - https://docs.github.com/en/authentication/connecting-to-github-with-ssh
  - https://github.com/settings/keys
- Download VSCode
  - https://code.visualstudio.com/download
- Download VSCode Extensions
  - Remote Desktop
- ROS Tutorials:
  - https://wiki.ros.org/ROS/Tutorials
  - https://www.youtube.com/@ArticulatedRobotics
