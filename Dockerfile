FROM centos:7

RUN yum -y update \
 && yum -y install curl sudo sysvinit-tools \
                   autoconf automake gcc gcc-c++ git libtool redhat-lsb-core \
                   pcsc-lite pcsc-lite-devel engine_pkcs11 softhsm unzip usbutils

WORKDIR /root
RUN wget https://github.com/OpenSC/OpenSC/releases/download/0.19.0/opensc-0.19.0.tar.gz \
 && tar xfvz opensc-*.tar.gz \
 && cd opensc-* \
 && ./bootstrap \
 && ./configure --prefix=/usr/local --sysconfdir=/etc/opensc \
 && make \
 && make install

