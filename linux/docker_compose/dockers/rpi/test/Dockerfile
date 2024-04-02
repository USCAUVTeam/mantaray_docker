FROM osrf/ros:melodic-desktop-full

RUN /bin/bash -c "apt-get update && \
    apt-get install -y \
        doxygen \
        libeigen3-dev \
        libboost-all-dev \
        python3-catkin-tools \
        ros-melodic-robot-localization \
        ros-melodic-pid \
        python3-pip \
        python3-setuptools \
        vim \
        tmux && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*"

# Create user and set up environment
RUN useradd -ms /bin/bash mantaray && \
    echo "mantaray:mantaray" | chpasswd && \
    usermod -aG sudo mantaray && \
    mkdir -p /home/mantaray/catkin_ws/src && \
    chown -R mantaray:mantaray /home/mantaray

# Switch to user context
USER mantaray
WORKDIR /home/mantaray

# Set up ROS environment
RUN echo "source /opt/ros/melodic/setup.bash" >> ~/.bashrc && \
    echo "source ~/catkin_ws/devel/setup.bash" >> ~/.bashrc

# Install additional Python packages
RUN pip3 install --upgrade --ignore-installed pip setuptools \
    roslibpy keyboard filterpy numpy pandas empy==3.3.4

# Build catkin workspace
RUN /bin/bash -c "source /opt/ros/melodic/setup.bash && \
    cd catkin_ws && \
    catkin build -DCMAKE_BUILD_TYPE=Release -DPYTHON_EXECUTABLE=/usr/bin/python3"

CMD ["bash"]

