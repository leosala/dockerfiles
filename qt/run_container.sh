#!/bin/bash 
d_user=developer

docker run --env DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix:ro -v /home/sala/.Xauthority:/home/${d_user}/.Xauthority -P -ti --rm qt:centos
