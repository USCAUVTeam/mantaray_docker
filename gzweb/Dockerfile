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
RUN passwd -d mantaray 
USER mantaray
WORKDIR /home/mantaray
RUN sudo apt-get update && sudo apt -y install ros-melodic-uuv-simulator
RUN sudo apt-get install -y vim git
#RUN sudo apt-get install -y libglu1-mesa-dev freeglut3-dev mesa-common-dev vim

RUN echo "source /opt/ros/melodic/setup.bash" >> ~/.bashrc

RUN source /opt/ros/melodic/setup.bash && mkdir -p catkin_ws/src && cd catkin_ws && catkin_make

#Install things for running gzweb
RUN apt install -y gazebo9 libgazebo9-dev libjansson-dev libboost-dev imagemagick libtinyxml-dev mercurial cmake build-essential

RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash && source ~/.bashrc && nvm install 8

RUN cd~; git clone https://github.com/osrf/gzweb && cd ~/gzweb && git checkout gzweb_1.4.1 && source /usr/share/gazebo/setup.sh && npm run deploy --- -m

CMD ["gzserver", "--verbose"]
ENTRYPOINT ["/bin/bash"]
