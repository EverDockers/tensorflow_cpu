FROM ubuntu:16.04
MAINTAINER Baker Wang <baikangwang@hotmail.com>

#usage: docker run -it -v projects:/projects -p 6006:6006 baikangwang/tensorflow_cpu:tfonly2

RUN apt update && \
    apt install -y --no-install-recommends apt-utils \
    # Developer Essentials
    git curl vim unzip wget && \
    #
    # Cleanup
    #
    apt clean && \
    apt autoremove && \
    rm -rf /var/lib/apt/lists/*
#
# Python 2.7
#
RUN apt update && \
    apt install -y --no-install-recommends python2.7 python-dev python-pip && \
    pip install --no-cache-dir --upgrade pip setuptools && \
    #
    # Cleanup
    #
    apt clean && \
    apt autoremove && \
    rm -rf /var/lib/apt/lists/*

#
# Tensorflow 1.3.0 - GPU
#
#
RUN pip install --no-cache-dir --upgrade tensorflow-gpu

#
# Specify working folder
#
RUN mkdir /projects
WORKDIR "/projects"

#
# Tensorboard : 6006
#
EXPOSE 6006

CMD ["/bin/bash"]