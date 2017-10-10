# Tensorflow (cpu)

* repository
  * [`baikangwang/tensorflow_cpu`](https://hub.docker.com/r/baikangwang/tensorflow_cpu/)  
    ![Docker Automated buil](https://img.shields.io/docker/automated/baikangwang/tensorflow_cpu.svg)
    ![Docker Stars](https://img.shields.io/docker/stars/baikangwang/tensorflow_cpu.svg)
    ![Docker Pulls](https://img.shields.io/docker/pulls/baikangwang/tensorflow_cpu.svg)
    ![Docker Build Statu](https://img.shields.io/docker/build/baikangwang/tensorflow_cpu.svg)
* tags
    * [`tfonly`,`latest`](#tfonly-latest)
    * [`tfonly_py2`](#tfonly_py2)
    * [`jupyter`,`jupyter_py3`](#jupyter-jupyter_py3)
    * [`jupyter_py2`](#jupyter_py2)
    * [`emnist`](#emnist)

## `tfonly`, `latest`

### Description

provides fundamental developing environment of machine learning, `python 3.5`+`tensorflow`

|     Docker      |                                                                        |
| :-------------- | :--------------------------------------------------------------------- |
| __Docker Pull__ | `docker pull baikangwang/tensorflow_cpu[:tfonly]`                      |
| __Dockerfile__  | <https://github.com/EverDockers/tensorflow_cpu/blob/tfonly/Dockerfile> |

### Usage

```bash
docker run -it --name <container name> -v <local working dir>:/projects -p <host port>:6006 baikangwang/tensorflow_cpu:tfonly [/bin/bash]
```

### Components

* nvidia-docker: 1.0
* cuda: 8.0.61
* cudnn: 6.0.21
* tensorflow: 1.3.0
* python: 3.5

## `tfonly_py2`

### Description

provides fundamental developing environment of machine learning with __python 2.7__, `python 2.7`+`tensorflow`

|     Docker      |                                                                         |
| :-------------- | :---------------------------------------------------------------------- |
| __Docker Pull__ | `docker pull baikangwang/tensorflow_cpu:tfonly_py2`                     |
| __Dockerfile__  | <https://github.com/EverDockers/tensorflow_cpu/blob/tfonly2/Dockerfile> |

### Usage

```bash
docker run -it --name <container name> -v <local working dir>:/projects -p <host port>:6006 baikangwang/tensorflow_cpu:tfonly_py2 [/bin/bash] 
```

### Components

* nvidia-docker: 1.0
* cuda: 8.0.61
* cudnn: 6.0.21
* tensorflow: 1.3.0
* python: 2.7

## `jupyter`,`jupyter_py3`

### Description

based on baikangwang/tensorflow_cpu:tfonly and provides python development environment,
`python 3.5`+`tensorflow`+`jupyter`

|     Docker      |                                                                          |
| :-------------- | :----------------------------------------------------------------------- |
| __Docker Pull__ | `docker pull baikangwang/tensorflow_cpu:jupyter`                         |
| __Dockerfile__  | <https://github.com/EverDockers/tensorflow_cpu/blob/jupyter2/Dockerfile> |

### Usage

```bash
docker run -it --name <container name> -v <local working dir>:/projects -p <host port>:8888 baikangwang/tensorflow_cpu:jupyter [/bin/bash]
```

> NOTE: the default command is `/run_jupyter.sh --allow-root`, which will automatically launch jupyter notebook.
When create the container with a initial command as `/bin/bash`, should manually launch the jupyter notebook within
the container, `/run_jupyter.sh --allow-root`

### Components

* nvidia-docker: 1.0
* cuda: 8.0.61
* cudnn: 6.0.21
* tensorflow: 1.3.0
* python: 3.5
* jupyter

## `jupyter_py2`

### Description

based on baikangwang/tensorflow_cpu:tfonly_py2 and provides __python 2.7__ development environment,
`python`+`tensorflow`+`jupyter`

|     Docker      |                                                                          |
| :-------------- | :----------------------------------------------------------------------- |
| __Docker Pull__ | `docker pull baikangwang/tensorflow_cpu:jupyter_py2`                     |
| __Dockerfile__  | <https://github.com/EverDockers/tensorflow_cpu/blob/jupyter2/Dockerfile> |

### Usage

```bash
nvidia-docker run -it --name <container name> -v <local working dir>:/projects -p <host port>:8888 baikangwang/tensorflow_cpu:jupyter_py2 [/bin/bash]
```

> NOTE: the default command is `/run_jupyter.sh --allow-root`, which will automatically launch jupyter notebook.
When create the container with a initial command as `/bin/bash`, should manually launch the jupyter notebook within
the container, `/run_jupyter.sh --allow-root`

### Components

* nvidia-docker: 1.0
* cuda: 8.0.61
* cudnn: 6.0.21
* tensorflow: 1.3.0
* python: 2.7
* jupyter

## `emnist`

### Description

based on baikangwang/tensorflow_cpu:tfonly and provides python development environment,
`python 3.5`+`tensorflow`+`jupyter`+`keras`

|     Docker      |                                                                          |
| :-------------- | :----------------------------------------------------------------------- |
| __Docker Pull__ | `docker pull baikangwang/tensorflow_cpu:emnist`                         |
| __Dockerfile__  | <https://github.com/EverDockers/tensorflow_cpu/blob/emnist/Dockerfile> |

### Usage

```bash
docker run -it --name <container name> -v <local working dir>:/projects -p <host port>:8888 -p <host port>:5000 baikangwang/tensorflow_cpu:emnist [/bin/bash]
```

### Components

* nvidia-docker: 1.0
* cuda: 8.0.61
* cudnn: 6.0.21
* tensorflow: 1.3.0
* python: 3.5
* jupyter
* keras