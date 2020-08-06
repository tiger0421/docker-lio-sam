#!/bin/bash
xhost +local:root

docker run -it --name lio \
    -v ~/share:/root/share \
    -v ~/ros_ws/lio_ws:/root/catkin_ws \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -e DISPLAY=$DISPLAY \
    -e QT_X11_NO_MITSHM=1 \
    --gpus all \
    tiger0421/docker-lio-sam \
    /bin/bash

xhost -local:root
