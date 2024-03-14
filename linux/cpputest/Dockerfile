FROM debian:bullseye

# Install the required packages.
RUN apt update -y && \ 
    apt -y install g++=4:10.2.1-1 \
                   cmake=3.18.4-2+deb11u1 \
                   libtool=2.4.6-15 \
                   autoconf=2.69-14 \
                   git=1:2.30.2-1+deb11u2

RUN git clone https://github.com/cpputest/cpputest

WORKDIR /cpputest

RUN autoreconf . -i && \
    ./configure && \
    make tdd

ENV CPPUTEST_HOME=/cpputest

WORKDIR /work