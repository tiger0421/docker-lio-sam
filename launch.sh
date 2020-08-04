#!/bin/bash
xhost +local:root

docker run -it --name lego-loam \
    -v ~/share:/root/share \
    -v ~/ros_ws/catkin_lego_ws:/root/catkin_ws \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -e DISPLAY=$DISPLAY \
    -e QT_X11_NO_MITSHM=1 \
    --gpus all \
    lego-loam:1.0-glvnd-runtime-ubuntu18.04 \
    /bin/bash

xhost -local:root
