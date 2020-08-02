FROM debian
LABEL maintainer="sjkillen@ualberta.ca"

RUN apt-get -qq update
RUN apt-get -qq install git libgmp-dev cmake build-essential
# Locked using v3.18.4 for guaranteed stability
RUN git clone --depth=1 https://github.com/leanprover-community/lean -b v3.18.4

RUN cd lean && \
mkdir -p build/release && \
cd build/release && \
cmake ../../src && \
make -j12
RUN cd lean/build/release && make -j12 install
