FROM ros:foxy

RUN apt-get update && apt-get install -y \
    tmux \
    ros-foxy-xacro \
    ros-foxy-image-transport-plugins \
    ros-foxy-rplidar-ros \
    ros-foxy-v4l2-camera \
    v4l-utils \
    ros-foxy-ros2-control \
    ros-foxy-ros2-controllers \
    ros-foxy-rosbridge-suite \
    ros-foxy-controller-manager \
    ros-foxy-joy-linux \
    ros-foxy-joy-teleop \
    ros-foxy-teleop-twist-joy \
    ros-foxy-slam-toolbox \
    ros-foxy-navigation2 \
    ros-foxy-nav2-bringup \
    protobuf-compiler \
    libboost-all-dev \
    udev \
    python3-pip

RUN python3 -m pip install flask

COPY firmware.udev /etc/udev/rules.d/80-firmware.rules

RUN mkdir -p otomo2_ws/src
RUN git clone https://github.com/TWALL9/otomo_msgs.git otomo2_ws/src/otomo_msgs
RUN cd otomo2_ws/src/otomo_msgs && git submodule update --init && cd /
RUN git clone https://github.com/TWALL9/otomo_control.git otomo2_ws/src/otomo_control
RUN git clone https://github.com/TWALL9/otomo_core.git otomo2_ws/src/otomo_core
RUN git clone https://github.com/TWALL9/otomo_plugins.git otomo2_ws/src/otomo_plugins
RUN git clone https://github.com/TWALL9/otomo_webserver.git otomo2_ws/src/otomo_webserver
RUN git clone https://github.com/TWALL9/async_serial.git otomo2_ws/src/async_serial

RUN apt install -y vim
