FROM centos:7

# RUN apt-get update && apt-get install -y firefox
RUN yum -y update && yum install -y dbus-x11 openssh-server xterm
RUN yum install -y qt-config
#RUN yum install -y firefox
#xauth

#xauth
RUN yum -y install sudo

#Replace 1000 with your user / group id
RUN export uid=1000 gid=1000 && \
    mkdir -p /home/developer && \
    echo "developer:x:${uid}:${gid}:Developer,,,:/home/developer:/bin/bash" >> /etc/passwd && \
    echo "developer:x:${uid}:" >> /etc/group && \
    echo "developer ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/developer && \
    chmod 0440 /etc/sudoers.d/developer && \
    chown ${uid}:${gid} -R /home/developer
RUN echo "developer:password" | chpasswd 

# Centos7 sshd fix
RUN sed 's/UsePrivilegeSeparation yes/UsePrivilegeSeparation no/' -i /etc/ssh/sshd_config
RUN sed -i 's/session    required     pam_loginuid.so/#session    required     pam_loginuid.so/g' /etc/pam.d/sshd
RUN sed '/pam_loginuid.so/s/^/#/g' -i /etc/pam.d/*
#RUN sed 's/UsePAM yes/UsePAM no/' -i /etc/ssh/sshd_config
RUN sshd-keygen
RUN echo X11Forwarding yes >> /etc/ssh/ssh_config

# needed to solve QT issues
RUN dbus-uuidgen > /etc/machine-id
RUN export QT_GRAPHICSSYSTEM="native"

USER developer
ENV HOME /home/developer

#RUN ls -lah /home/developer

# you still need to do export DISPLAY=:0 (or whatever) when you log in
EXPOSE 22
CMD ["sudo", "/usr/sbin/sshd", "-D"]
