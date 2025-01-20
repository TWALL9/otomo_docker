FROM ros:jazzy

RUN apt-get update && apt-get install -y \
    tmux \
    ros-jazzy-xacro \
    ros-jazzy-image-transport-plugins \
    ros-jazzy-rplidar-ros \
    ros-jazzy-v4l2-camera \
    v4l-utils \
    ros-jazzy-ros2-control \
    ros-jazzy-ros2-controllers \
    ros-jazzy-rosbridge-suite \
    ros-jazzy-controller-manager \
    ros-jazzy-joy-linux \
    ros-jazzy-joy-teleop \
    ros-jazzy-teleop-twist-joy \
    ros-jazzy-slam-toolbox \
    ros-jazzy-navigation2 \
    ros-jazzy-nav2-bringup \
    ros-jazzy-realsense2-camera \
    ros-jazzy-librealsense2 \
    ros-jazzy-twist-mux \
    vim \
    protobuf-compiler \
    libboost-all-dev \
    udev \
    usbutils \
    python3-pip \
    python3-rosdep

# RUN python3 -m pip install flask

COPY 80-st-board.rules /etc/udev/rules.d/80-st-board.rules

RUN mkdir -p otomo2_ws/src
RUN git clone https://github.com/TWALL9/otomo_msgs.git otomo2_ws/src/otomo_msgs
RUN cd otomo2_ws/src/otomo_msgs && git submodule update --init && cd /
RUN git clone https://github.com/TWALL9/otomo_control.git otomo2_ws/src/otomo_control
RUN git clone https://github.com/TWALL9/otomo_core.git otomo2_ws/src/otomo_core
RUN git clone https://github.com/TWALL9/otomo_plugins.git otomo2_ws/src/otomo_plugins
RUN git clone https://github.com/TWALL9/async_serial.git otomo2_ws/src/async_serial
RUN git clone https://github.com/ros-teleop/twist_mux.git otomo2_ws/src/twist_mux
