FROM ros:melodic

RUN apt-get update

RUN useradd -ms /bin/bash mantaray
RUN usermod -aG sudo mantaray
RUN echo "mantaray:mantaray" | sudo chpasswd

RUN apt-get update && sudo apt-get install -y doxygen libeigen3-dev libboost-all-dev python3-catkin-tools ros-melodic-robot-localization ros-melodic-pid python3-pip python3-setuptools ros-melodic-tf ros-melodic-xacro ros-melodic-robot-state-publisher

RUN pip3 install --upgrade --ignore-installed pip setuptools
RUN pip3 install roslibpy keyboard filterpy numpy pandas empy==3.3.4 rospkg
 
RUN apt-get update && apt-get install ros-melodic-pid vim tmux -y

SHELL ["/bin/bash","-c"]

USER mantaray
WORKDIR /home/mantaray

# Set up ROS environment
RUN echo "source /opt/ros/melodic/setup.bash" >> ~/.bashrc && \
    echo "source ~/catkin_ws/devel/setup.bash" >> ~/.bashrc

# Build catkin workspace
RUN /bin/bash -c "mkdir -p catkin_ws/src && \
    source /opt/ros/melodic/setup.bash && \
    cd catkin_ws && \
    catkin build -DCMAKE_BUILD_TYPE=Release -DPYTHON_EXECUTABLE=/usr/bin/python3"

CMD ["bash"]