FROM ubuntu:16.04

MAINTAINER Stephen Cagle

RUN apt-get update
RUN apt-get install \
        build-essential pkg-config libc6-dev m4 g++-multilib \
        autoconf libtool ncurses-dev unzip git python \
        zlib1g-dev wget bsdmainutils automake git -y
RUN git clone https://github.com/zcash/zcash.git
WORKDIR zcash
RUN git checkout v1.0.0
RUN ./zcutil/fetch-params.sh
RUN ./zcutil/build.sh -j$(nproc)

RUN mkdir -p ~/.zcash
RUN echo "addnode=mainnet.z.cash" >~/.zcash/zcash.conf
RUN echo "rpcuser=username" >>~/.zcash/zcash.conf
RUN echo "rpcpassword=`head -c 32 /dev/urandom | base64`" >>~/.zcash/zcash.conf

# Comment out the next 3 lines if you don't want to mine
RUN echo 'gen=1' >> ~/.zcash/zcash.conf
RUN echo "genproclimit=$(nproc)" >> ~/.zcash/zcash.conf
RUN echo 'equihashsolver=tromp' >> ~/.zcash/zcash.conf
