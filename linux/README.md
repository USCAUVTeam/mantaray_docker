## How to Get Things Set Up
Note, you need to be running a Linux computer for this following to work.
> The key to all of this is docker:
> Everything will be run in two docker containers. 
> The first docker container is going to be called **dockers-rpi-1** and will contain all of the necessary files and packages to run the programs within the vehicle. 
> The second docker container is called **dockers-sim-1** and contains everything to run the simulation. The second docker container will run a GUI that will display on your Linux device.

#### Quickstart
> The fastest way to see the mantaray vehicle moving within the Gazebo environment is by performing the following commands.
1. Within your terminal, run *./run_compose.sh* . This will create the dockers-rpi-1 and dockers-sim-1 containers and cause the Gazebo GUI to pop in front of your screen.
2. Create another terminal and run the *./run_sim.sh* bash file.
   1. Within the dockers-sim-1 docker container, run *roslaunch mantaray_description upload.launch*
3. Create another terminal and run the *./run_rpi.sh* bash file.  
   1. Within the dockers-rpi-1 docker container, run *./scripts/build.sh* to build the necessary packages in the catkin ws.
   2. Wait for the bash file to finish building and sourcing the packages.
   3. Run *roslaunch mantaray_rpi mantaray.launch*

#### Key Files
- **run_compose.sh**: Running this bash file will run both dockers-rpi-1 and dockers-sim-1. Within the dockers-sim-1, the container will generate the gazebo world and cause a GUI to pop up in your Linux machine, but you will have to manually upload the mantaray vehicle into the Gazebo environment. This can be done by running exec_sim.sh, and then running the following command within the docker container's terminal *roslaunch mantaray_description upload.launch* . The dockers-rpi-1 docker container will build the catkin workspace, but you will have to manually source the packages within the workplace by running *source ~/catkin_ws/devel/setup.bash* . Then, you can launch whatever launch file you want to. To see the default behavior of the vehicle, run *roslaunch mantaray_rpi mantaray.launch* . 
- **run_rpi.sh**: Running this bash file will create a docker container for dockers-rpi-1. This is useful when you want to only run this docker container for tests. 
- **run_sim.sh**: Running this bash file will create a docker container for dockers-sim-1. This is useful when you want to only run this docker container for tests.
- **exec_rpi.sh**: Running this bash file will create a bash terminal within an existing dockers-rpi-1 docker container. This is useful when you want to run multiple programs within a single docker container.
- **exec_sim.sh**: Running this bash file will create a bash terminal within an existing dockers-sim-1 docker container. This is useful when you want to run multiple programs within a single docker container.

#### HELP ME
- If any of the bash files fail to run because they aren't recognized as executables, **run chmod +x \*** within the folder with the bash files. This will allow your system to run the bash files as executables.


#### Maintainers
- Kojiro Yamada: <kojiroy@usc.edu>