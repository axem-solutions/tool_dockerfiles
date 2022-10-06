FROM debian:latest

WORKDIR /work


RUN apt-get update
RUN apt-get -y install git \
					   gdb \					   
					   libusb-1.0-0-dev \
					   usbutils \
					   make \
					   cmake \
					   gcc \
					   build-essential
					   
					   
RUN cd $HOME \
&& git clone https://github.com/stlink-org/stlink \
&& cd stlink \
&& cmake .\
&& make \
&& cd bin \
&& cp st-* /usr/local/bin \
&& cd ../lib \
&& cp *.so* /lib

ENV PATH=”/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:$HOME/stlink/build/Release/_install/usr/local/bin:${PATH}”


					   
