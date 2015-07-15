FROM centos:7

# RUN apt-get update && apt-get install -y firefox
RUN yum -y update && yum install -y dbus-x11 xterm openssh-server
#RUN yum install -y qt-config
#RUN yum install -y firefox
RUN yum install -y liberation-fonts-common liberation-sans-fonts
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

# QT devel stuff
#RUN yum install -y qt-devel gcc-c++ gdb
# needed workarounds to compile slsDetectors
#RUN ln -sf /usr/bin/qmake-qt4 /usr/bin/qmake
#RUN ln -sf /usr/bin/uic-qt4 /usr/bin/uic
#RUN ln -sf /usr/bin/moc-qt4 /usr/bin/moc


USER developer
ENV HOME /home/developer
ENV QT_GRAPHICSSYSTEM native

#RUN ls -lah /home/developer
#EXPOSE 22
CMD ["/bin/bash"]

# you still need to do export DISPLAY=:0 (or whatever) when you log in

#CMD ["sudo", "/usr/sbin/sshd", "-D"]
