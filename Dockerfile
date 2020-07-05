FROM ubuntu:18.04 as builder

RUN apt update
RUN apt install -y \
        software-properties-common \
        libboost-dev \
        wget \
        unzip \
        cmake

RUN add-apt-repository ppa:longsleep/golang-backports
RUN apt update
RUN apt install -y golang-go

RUN wget 'https://downloads.isc.org/isc/kea/1.6.2/kea-1.6.2.tar.gz'
RUN tar xf kea-1.6.2.tar.gz
RUN mkdir -p /usr/include/kea
RUN cp -r kea-1.6.2/src/lib/* /usr/include/kea

RUN wget 'https://github.com/egs33/kea-hook-dynamic-lifetime/archive/master.zip'
RUN unzip master.zip

COPY builder.sh ./kea-hook-dynamic-lifetime-master

WORKDIR ./kea-hook-dynamic-lifetime-master

CMD ["./builder.sh"]
