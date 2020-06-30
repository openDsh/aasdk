
# aasdk

### Brief description
C++ object-oriented library containing implementation of core AndroidAuto(tm) functionalities needed to build headunit software.

### Build Guide
#### Local build instructions for Raspberry Pi

```
sudo apt-get update
sudo apt-get -y install cmake build-essential git

sudo apt-get install -y protobuf-compiler libprotobuf-dev libusb-1.0.0-dev libssl-dev libboost-dev libboost-system-dev libboost-log-dev

git clone https://github.com/OpenDsh/aasdk

mkdir aasdk_build; cd aasdk_build
cmake -DCMAKE_BUILD_TYPE=Release ../aasdk
make -j2
```

### Supported functionalities
 - AOAP (Android Open Accessory Protocol)
 - USB transport
 - TCP transport
 - USB hotplug
 - AndroidAuto(tm) protocol
 - SSL encryption

### Supported AndroidAuto(tm) communication channels
 - Media audio channel
 - System audio channel
 - Speech audio channel
 - Audio input channel
 - Video channel
 - Bluetooth channel
 - Sensor channel
 - Control channel
 - Input channel

### License
GNU GPLv3

Copyrights (c) 2018 f1x.studio (Michal Szwaj)

*AndroidAuto is registered trademark of Google Inc.*

### Used software
 - [Boost libraries](http://www.boost.org/)
 - [libusb](http://libusb.info/)
 - [CMake](https://cmake.org/)
 - [Protocol buffers](https://developers.google.com/protocol-buffers/)
 - [OpenSSL](https://www.openssl.org/)
 - [Google test framework](https://github.com/google/googletest)