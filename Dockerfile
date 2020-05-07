FROM debian
LABEL maintainer="sjkillen@ualberta.ca"

RUN apt-get -qq update
RUN apt-get -qq install git libgmp-dev cmake build-essential
RUN git clone --depth=1 https://github.com/leanprover-community/lean -b master

RUN cd lean && \
mkdir -p build/release && \
cd build/release && \
cmake ../../src && \
make
RUN cd lean/build/release && make install
