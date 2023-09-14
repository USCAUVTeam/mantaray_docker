FROM dorowu/ubuntu-desktop-lxde-vnc:bionic-arm64
SHELL ["/bin/bash","-c"]

RUN apt update && sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list' && apt install -y gpg-agent

RUN apt install -y curl && curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | apt-key add - && apt update && apt install -y ros-melodic-desktop-full ros-melodic-uuv-simulator vim

RUN useradd -ms /bin/bash mantaray && usermod -aG sudo mantaray && echo "mantaray:mantaray" | sudo chpasswd

USER mantaray

WORKDIR /home/mantaray

RUN echo "source /opt/ros/melodic/setup.bash" >> /home/mantaray/.bashrc && mkdir -p catkin_ws/src && cd catkin_ws && source /opt/ros/melodic/setup.bash && catkin_make && echo "source ~/catkin_ws/devel/setup.bash" >> /home/mantaray/.bashrc

USER root
