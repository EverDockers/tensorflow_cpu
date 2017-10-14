FROM ubuntu:16.04
MAINTAINER Baker Wang <baikangwang@hotmail.com>

#usage: docker run -it -v projects:/projects -p 6006:6006 baikangwang/tensorflow_cpu:tfonly

# Set the locale
# https://stackoverflow.com/questions/28405902/how-to-set-the-locale-inside-a-docker-container
RUN sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && \
    locale-gen
ENV LANG en_US.UTF-8  
ENV LANGUAGE en_US:en  
ENV LC_ALL en_US.UTF-8

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
# Python 3.5
#
RUN apt update && \
    apt install -y --no-install-recommends python3.5 python3.5-dev python3-pip && \
    pip3 install --no-cache-dir --upgrade pip setuptools && \
    echo "alias python='python3'" >> /root/.bash_aliases && \
    echo "alias pip='pip3'" >> /root/.bash_aliases && \
    #
    # Cleanup
    #
    apt clean && \
    apt autoremove && \
    rm -rf /var/lib/apt/lists/*

#
# Tensorflow 1.3.0 - CPU
#
RUN pip3 install --no-cache-dir --upgrade tensorflow

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