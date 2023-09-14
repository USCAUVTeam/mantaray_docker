FROM osrf/ros:melodic-desktop-full
SHELL ["/bin/bash","-c"]

RUN apt-get update

# nvidia-container-runtime
ENV NVIDIA_VISIBLE_DEVICES \
    ${NVIDIA_VISIBLE_DEVICES:-all}
ENV NVIDIA_DRIVER_CAPABILITIES \
    ${NVIDIA_DRIVER_CAPABILITIES:+$NVIDIA_DRIVER_CAPABILITIES,}graphics
RUN useradd -ms /bin/bash mantaray
RUN usermod -aG sudo mantaray
RUN echo "mantaray:mantaray" | sudo chpasswd
WORKDIR /home/mantaray
RUN apt-get install -y libglu1-mesa-dev freeglut3-dev mesa-common-dev vim

RUN echo "source /opt/ros/melodic/setup.bash" >> ~/.bashrc

USER mantaray

RUN source /opt/ros/melodic/setup.bash && mkdir -p catkin_ws/src && cd catkin_ws && catkin_make

RUN echo "source ~/catkin_ws/devel/setup.bash" >> ~/.bashrc
