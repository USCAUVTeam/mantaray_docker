FROM auv_rpi:0

RUN apt-get update && \
    apt-get install -y ros-melodic-tf python-smbus ros-melodic-xacro ros-melodic-robot-state-publisher

RUN pip3 install Adafruit-Blinka adafruit-circuitpython-pca9685 rospkg netifaces RPi.GPIO

SHELL ["/bin/bash","-c"]

USER mantaray

RUN source /opt/ros/melodic/setup.bash && mkdir -p catkin_ws/src && cd catkin_ws && catkin build -DCMAKE_BUILD_TYPE=Release -DPYTHON_EXECUTABLE=/usr/bin/python3 

RUN echo "source ~/catkin_ws/devel/setup.bash" >> ~/.bashrc

CMD ["bash"]
