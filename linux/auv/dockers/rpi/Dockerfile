FROM osrf/ros:melodic-desktop-full
SHELL ["/bin/bash","-c"]
RUN apt-get update
RUN apt-get -y install xauth 

# nvidia-container-runtime
ENV NVIDIA_VISIBLE_DEVICES \
    ${NVIDIA_VISIBLE_DEVICES:-all} 
ENV NVIDIA_DRIVER_CAPABILITIES \
    ${NVIDIA_DRIVER_CAPABILITIES:+$NVIDIA_DRIVER_CAPABILITIES,}graphics
RUN useradd -ms /bin/bash mantaray
RUN usermod -aG sudo mantaray
RUN echo "mantaray:mantaray" | sudo chpasswd
WORKDIR /home/mantaray

RUN apt-get update && apt -y install ros-melodic-uuv-simulator
RUN apt-get install -y libglu1-mesa-dev freeglut3-dev mesa-common-dev vim

RUN apt-get update && sudo apt-get install -y doxygen libeigen3-dev libboost-all-dev python3-catkin-tools ros-melodic-robot-localization ros-melodic-pid python3-pip python3-setuptools

RUN pip3 install --upgrade --ignore-installed pip setuptools
RUN pip3 install roslibpy keyboard filterpy numpy pandas 

USER mantaray

RUN source /opt/ros/melodic/setup.bash && mkdir -p catkin_ws/src && cd catkin_ws && catkin_make

RUN echo "source ~/catkin_ws/devel/setup.bash" >> ~/.bashrc
RUN echo "source /opt/ros/melodic/setup.bash" >> ~/.bashrc

CMD ["bash"]
