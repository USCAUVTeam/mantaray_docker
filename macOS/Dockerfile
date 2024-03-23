FROM ros:melodic
SHELL ["/bin/bash","-c"]
RUN apt-get update && apt-get install -y tmux vim python3-catkin-tools python3-pip python3-setuptools

RUN useradd -ms /bin/bash mantaray
RUN usermod -aG sudo mantaray
RUN echo "mantaray:mantaray" | sudo chpasswd
WORKDIR /home/mantaray

RUN echo "if [ -f ~/.bashrc ]; then source ~/.bashrc; fi" >> /home/mantaray/.profile && chown mantaray:mantaray /home/mantaray/.profile
RUN echo "source ~/catkin_ws/devel/setup.bash" >> ~/.bashrc && echo "source /opt/ros/melodic/setup.bash" >> ~/.bashrc

COPY start_tmux.sh /start_tmux.sh
RUN chmod +x /start_tmux.sh && chown mantaray:mantaray /start_tmux.sh

USER mantaray

RUN source /opt/ros/melodic/setup.bash && mkdir -p catkin_ws/src && cd catkin_ws && catkin_make

CMD ["/start_tmux.sh", "&& bash"]
