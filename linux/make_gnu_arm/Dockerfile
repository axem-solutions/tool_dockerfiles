FROM debian:latest

WORKDIR /work


RUN apt-get update
RUN apt-get -y install 	gcc \
			gdb \					   
			cmake \
			wget \
			bzip2 \
			libncurses5
					   
					   
RUN wget https://developer.arm.com/-/media/Files/downloads/gnu-rm/10.3-2021.10/gcc-arm-none-eabi-10.3-2021.10-x86_64-linux.tar.bz2 \
&& tar -xjf gcc-arm-none-eabi-10.3-2021.10-x86_64-linux.tar.bz2 \
&& rm gcc-arm-none-eabi-10.3-2021.10-x86_64-linux.tar.bz2 \
&& mv gcc-arm-none-eabi-10.3-2021.10 /opt/gcc-arm


ENV PATH=”/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/X11/bin:/opt/gcc-arm/bin:${PATH}”


					   
