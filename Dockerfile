FROM debian:latest AS aasdk

RUN apt-get update
RUN apt-get -y install cmake build-essential git

RUN apt-get install -y libboost-all-dev libusb-1.0.0-dev libssl-dev libprotobuf-dev protobuf-c-compiler protobuf-compiler libqt5multimedia5 libqt5multimedia5-plugins libqt5multimediawidgets5 qtmultimedia5-dev libqt5bluetooth5 libqt5bluetooth5-bin qtconnectivity5-dev pulseaudio librtaudio-dev

COPY . /src

WORKDIR /src

# Some cross-compilation info from https://www.raspberrypi.org/documentation/linux/kernel/building.md
RUN git clone --depth=1 https://github.com/raspberrypi/tools ~/tools
RUN echo PATH=\$PATH:~/tools/arm-bcm2708/arm-linux-gnueabihf/bin >> ~/.bashrc
# RUN source ~/.bashrc

# Import resources
COPY ./resources /src/resources
COPY ./entrypoint.sh /entrypoint.sh

# Make Executable
RUN chmod +x /entrypoint.sh

# ENTRYPOINT ["/entrypoint.sh"]
CMD /bin/bash