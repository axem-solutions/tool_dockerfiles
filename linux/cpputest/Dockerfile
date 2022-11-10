FROM debian:latest

RUN apt-get update
RUN apt-get -y install 	gcc \
			g++ \
			cmake \
			git \
			libtool \
			autoconf

WORKDIR /cpputest
RUN git clone https://github.com/cpputest/cpputest.git .
RUN autoreconf . -i
RUN ./configure
RUN make tdd

ENV CPPUTEST_HOME=/cpputest

WORKDIR /work

