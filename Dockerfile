FROM baikangwang/tensorflow_cpu:jupyter
LABEL Author = "Baker Wang <baikangwang@hotmail.com>" 

#usage: docker run -it -v projects:/projects -p 8888:8888 -p 6006:6006 -p 5000:5000 baikangwang/tensorflow_cpu:emnist

#
# environment
#
RUN pip3 --no-cache-dir install keras h5py flask && \

    pip3 --no-cache-dir install --upgrade scipy

#
# server port
#
EXPOSE 5000

CMD ["/bin/bash"]