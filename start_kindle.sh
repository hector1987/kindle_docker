#!/usr/bin/env bash

shopt -s expand_aliases

alias docker_kindle='docker run -it --rm -u 2000:2000 -e DISPLAY=${DISPLAY} -v "/tmp/.X11-unix/:/tmp/.X11-unix:rw" -v winehome:/home/wineuser --ipc host kindle_img'

xhost +si:localuser:#2000
docker_kindle /bin/bash -c "rm '/home/wineuser/.wine/dosdevices/c:/users/wineuser/AppData/Local/Amazon/Kindle/updates/KindleForPC-installer.exe'"
docker_kindle /bin/bash -c "wine '/home/wineuser/.wine/dosdevices/c:/Program Files (x86)/Amazon/Kindle/Kindle.exe' && sleep 1"
xhost -si:localuser:#2000
