
FROM ubuntu:16.04
MAINTAINER Baker Wang <baikangwang@hotmail.com>

#usage: docker run -it -v notebooks:/notebooks -p 8888:8888 -p 6006:6006 kevin8093/test_tf 

# Supress warnings about missing front-end. As recommended at:
# http://stackoverflow.com/questions/22466255/is-it-possibe-to-answer-dialog-questions-when-installing-under-docker
ARG DEBIAN_FRONTEND=noninteractive

RUN apt update && \
    apt install -y --no-install-recommends apt-utils \
    # Developer Essentials
    git curl vim unzip openssh-client wget \
    # Build tools
    build-essential cmake \
    # OpenBLAS
    libopenblas-dev \
    #
    # Python 3.5
    #
    # For convenience, alisas (but don't sym-link) python & pip to python3 & pip3 as recommended in:
    # http://askubuntu.com/questions/351318/changing-symlink-python-to-python3-causes-problems
    python3.5 python3.5-dev python3-pip && \
    pip3 install --no-cache-dir --upgrade pip setuptools && \
    echo "alias python='python3'" >> /root/.bash_aliases && \
    echo "alias pip='pip3'" >> /root/.bash_aliases && \
    # Pillow and it's dependencies
    apt install -y --no-install-recommends libjpeg-dev zlib1g-dev && \
    pip3 --no-cache-dir install Pillow && \
    # Common libraries
    pip3 --no-cache-dir install numpy scipy sklearn scikit-image pandas matplotlib && \
    #
    # Jupyter Notebook
    #
    pip3 --no-cache-dir install jupyter && \
    #
    # Allow access from outside the container, and skip trying to open a browser.
    # NOTE: disable authentication token for convenience. DON'T DO THIS ON A PUBLIC SERVER.
    mkdir /root/.jupyter && \
    echo "c.NotebookApp.ip = '*'" \
         "\nc.NotebookApp.open_browser = False" \
         "\nc.NotebookApp.token = ''" \
         > /root/.jupyter/jupyter_notebook_config.py && \
    # Juypter notebook extensions
    # <https://github.com/ipython-contrib/jupyter_contrib_nbextensions>
    #
    pip3 --no-cache-dir install jupyter_contrib_nbextensions \
    #
    # Prerequisites of the extension Code Prettifier
    yapf && \
    # install javascript and css files
    jupyter contrib nbextension install --user && \
    # enable code prettifier
    jupyter nbextension enable code_prettify/code_prettify && \
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
# Jupyter Notebook : 8888
# Tensorboard : 6006
#
EXPOSE 8888 6006

COPY run_jupyter.sh /

WORKDIR "/notebooks"
CMD ["/run_jupyter.sh", "--allow-root"]