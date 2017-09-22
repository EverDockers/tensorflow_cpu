FROM baikangwang/tensorflow_cpu:tfonly_py2
MAINTAINER Baker Wang <baikangwang@hotmail.com>

#usage: docker run -it -v projects:/projects -p 8888:8888 -p 6006:6006 baikangwang/tensorflow_cpu:jupyter_py2

RUN apt update && \
    # Build tools
    apt install -y --no-install-recommends build-essential cmake \
    # OpenBLAS
    libopenblas-dev \
    # Pillow and it's dependencies
    libjpeg-dev zlib1g-dev && \
    #
    # Cleanup
    #
    apt clean && \
    apt autoremove && \
    rm -rf /var/lib/apt/lists/*

#
# Jupyter Notebook
#
RUN pip --no-cache-dir install Pillow \
    # Common libraries
    numpy scipy sklearn scikit-image pandas matplotlib && \

    pip --no-cache-dir install jupyter && \
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
    pip --no-cache-dir install jupyter_contrib_nbextensions \
    #
    # Prerequisites of the extension Code Prettifier
    yapf && \
    # install javascript and css files
    jupyter contrib nbextension install --user && \
    # enable code prettifier
    jupyter nbextension enable code_prettify/code_prettify


EXPOSE 8888

COPY run_jupyter.sh /

CMD ["/run_jupyter.sh", "--allow-root"]