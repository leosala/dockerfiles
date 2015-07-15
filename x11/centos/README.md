# Compilation and running

**Compilation**
`docker build -t basex11 .`

**Running**
`docker run -e DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix -v $HOME/.Xauthority:/home/developer/.Xauthority -ti --rm --net=host basex11:centos7`
