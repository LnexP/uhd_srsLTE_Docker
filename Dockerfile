FROM ubuntu:bionic

RUN apt update \
&& apt install apt-transport-https ca-certificates -y \
&& sed -i 's/http:\/\/archive.ubuntu.com/http:\/\/mirrors.sjtug.sjtu.edu.cn/g' /etc/apt/sources.list \
&& apt update \
&&   apt install libboost-all-dev libusb-1.0-0-dev doxygen python3-docutils python3-mako python3-numpy python3-requests python3-ruamel.yaml python3-setuptools cmake build-essential git cmake libfftw3-dev libmbedtls-dev libboost-program-options-dev libconfig++-dev libsctp-dev -y \
&& cd $HOME \
&& git clone https://github.com/EttusResearch/uhd.git \
&& cd uhd \
&& git checkout v3.15.0.0 \
&& cd host \
&& mkdir build \
&& cd build \
&& cpu_num=`cat /proc/stat | grep cpu[0-9] -c` \
&& cmake .. \
&& make -j${cpu_num} \
&& make install \
&& ldconfig \
&& echo 'export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib' >> ~/.bashrc \
&& source ~/.bashrc \
&& cp $HOME/uhd/host/utils/uhd-usrp.rules /etc/udev/rules.d/ \
&& udevadm control --reload-rules \
&& udevadm trigger \
&& uhd_images_downloader \
&& cd $HOME \
&& git clone https://github.com/srsLTE/srsLTE.git \
&& cd srsLTE \
&& mkdir build \
&& cd build \
&& cmake .. \
&& make -j${cpu_num} \
&& make install \
#make test -j${cpu_num} \
&& ./srslte_install_configs.sh user \



