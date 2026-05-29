FROM ros:noetic

RUN apt-get update && apt-get install -y \
    git \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /home/rosserial/src && \
    cd /home/rosserial/src && \
    git clone --no-checkout https://github.com/tongtybj/rosserial && \
    cd rosserial && \
    git fetch --depth=1 origin 47a73176d281eb7cc582e6dc1eb83ada40cb5f8d && \
    git checkout FETCH_HEAD

RUN bash -c 'source /opt/ros/noetic/setup.bash && \
    cd /home/rosserial && \
    catkin_make -DCMAKE_INSTALL_PREFIX=/opt/ros/noetic install --only-pkg-with-deps rosserial_server'

ENV PORT=/dev/mowgli
ENV BAUD=115200

CMD ["bash", "-c", "rosrun rosserial_server serial_node _port:=${PORT} _baud:=${BAUD}"]
