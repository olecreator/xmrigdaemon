#MAINTAINER d13g0 <d13g0@null.org>

FROM ubuntu:latest

RUN  sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list && \
	apt-get update && apt-get install -y \
	software-properties-common git build-essential cmake libuv1-dev libmicrohttpd-dev wget vim

RUN add-apt-repository ppa:jonathonf/gcc-7.1 && \
	apt-get update && \
	apt-get install gcc-7 g++-7 -y

RUN  git clone https://github.com/Bendr0id/xmrigCC.git && \
	cd xmrigCC && \
	cmake . -DCMAKE_C_COMPILER=gcc-7 -DCMAKE_CXX_COMPILER=g++-7 -DWITH_CC_SERVER=OFF -DWITH_HTTPD=OFF && \
	make

ENTRYPOINT  ["/xmrigCC/xmrigDaemon"]
