FROM osrf/ros:melodic-desktop-full
SHELL ["/bin/bash","-c"]
RUN apt-get update

RUN useradd -ms /bin/bash mantaray
RUN usermod -aG sudo mantaray
RUN echo "mantaray:mantaray" | sudo chpasswd
WORKDIR /home/mantaray

RUN apt-get update && sudo apt-get install -y doxygen libeigen3-dev libboost-all-dev python3-catkin-tools ros-melodic-robot-localization ros-melodic-pid python3-pip python3-setuptools

RUN pip3 install --upgrade --ignore-installed pip setuptools
RUN pip3 install roslibpy keyboard filterpy numpy pandas empy==3.3.4
 
RUN apt-get update && apt-get install -y ros-melodic-pid vim tmux

USER mantaray

RUN source /opt/ros/melodic/setup.bash && mkdir -p catkin_ws/src && cd catkin_ws && catkin build -DCMAKE_BUILD_TYPE=Release -DPYTHON_EXECUTABLE=/usr/bin/python3 

RUN echo "source ~/catkin_ws/devel/setup.bash" >> ~/.bashrc
RUN echo "source /opt/ros/melodic/setup.bash" >> ~/.bashrc

CMD ["bash"]
