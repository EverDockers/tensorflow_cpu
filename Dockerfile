
FROM ubuntu:16.04
MAINTAINER Baker Wang <baikangwang@hotmail.com>

#usage: docker run -it -v notebooks:/notebooks -p 6006:6006 baikangwang/tensorflow_cpu:tfonly

# Supress warnings about missing front-end. As recommended at:
# http://stackoverflow.com/questions/22466255/is-it-possibe-to-answer-dialog-questions-when-installing-under-docker
ARG DEBIAN_FRONTEND=noninteractive

RUN apt update && \
    apt install -y --no-install-recommends apt-utils \
    # Developer Essentials
    git curl vim unzip wget \
    #
    # Python 3.5
    #
    # For convenience, alisas (but don't sym-link) python & pip to python3 & pip3 as recommended in:
    # http://askubuntu.com/questions/351318/changing-symlink-python-to-python3-causes-problems
    python3.5 python3.5-dev python3-pip && \
    pip3 install --no-cache-dir --upgrade pip setuptools && \
    echo "alias python='python3'" >> /root/.bash_aliases && \
    echo "alias pip='pip3'" >> /root/.bash_aliases && \
    #
    # Tensorflow 1.3.0 - CPU
    #
    pip3 install --no-cache-dir --upgrade tensorflow && \
    #
    # Cleanup
    #
    apt clean && \
    apt autoremove && \
    rm -rf /var/lib/apt/lists/* && \
    mkdir /notebooks
#
# Tensorboard : 6006
#
EXPOSE 6006

WORKDIR "/notebooks"
CMD ["/bin/bash"]