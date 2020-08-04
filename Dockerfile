FROM tiger0421/ros-gpu-gazebo:1.0-glvnd-runtime-ubuntu18.04

ENV DEBIAN_FRONTEND=noninteractive
RUN apt update && \
    apt install -y \
        unzip \
        ros-$(ls /opt/ros)-geodesy \
        ros-$(ls /opt/ros)-pcl-ros \
        ros-$(ls /opt/ros)-nmea-msgs \
        ros-$(ls /opt/ros)-libg2o \
    && \
    apt autoremove -y && \
    apt clean && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /root/Downloads
RUN wget -O /root/Downloads/gtsam.zip https://github.com/borglab/gtsam/archive/4.0.2.zip && \
    unzip gtsam.zip -d /root/Downloads/ && \
    cd /root/Downloads/gtsam-4.0.2/ && \
    mkdir build && cd build && \
    cmake -DGTSAM_BUILD_WITH_MARCH_NATIVE=OFF .. && \
    make install

WORKDIR /root/catkin_ws/src
COPY docker-entrypoint.sh /tmp
RUN chmod +x /tmp/docker-entrypoint.sh && echo source /root/catkin_ws/devel/setup.bash >> /root/.bashrc
ENTRYPOINT ["/tmp/docker-entrypoint.sh"]
CMD ["/bin/bash"]
WORKDIR /root
