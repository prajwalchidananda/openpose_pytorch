FROM nvidia/cuda:9.0-cudnn7-devel-ubuntu16.04 

RUN echo "deb http://developer.download.nvidia.com/compute/machine-learning/repos/ubuntu1604/x86_64 /" > /etc/apt/sources.list.d/nvidia-ml.list

RUN apt-get update && apt-get install -y --no-install-recommends \
        build-essential \
        cmake \
        sudo \
        git \
        wget \
        vim \
        ssh \
        emacs \
        rsync \
        screen \
        curl \
        zip \ 
        unzip \
        tmux \
        ca-certificates \
        libjpeg-dev \
        libpng-dev \
        libopencv-dev \
        python3.5-dev \
        python3.5-tk \
        python3-pip \
        python3-setuptools \
        python-setuptools \
        tk-dev \
        libfreetype6-dev \
        cython \
        libhdf5-dev \
        g++ \
        tmux && \
    rm -rf /var/lib/apt/lists/*

RUN curl -o ~/miniconda.sh -O  https://repo.continuum.io/miniconda/Miniconda3-4.2.12-Linux-x86_64.sh  && \
     chmod +x ~/miniconda.sh && \
     ~/miniconda.sh -b -p /opt/conda && \     
     rm ~/miniconda.sh && \
     /opt/conda/bin/conda install conda-build && \
     /opt/conda/bin/conda create -y --name pytorch-py35 python=3.5.2 numpy pyyaml scipy ipython mkl&& \
     /opt/conda/bin/conda clean -ya 
 
ENV PATH /opt/conda/envs/pytorch-py35/bin:$PATH

RUN conda install --name pytorch-py35 numpy pyyaml mkl mkl-include setuptools cmake cffi typing matplotlib
RUN conda install --name pytorch-py35 -c pytorch magma-cuda80

RUN conda install --name pytorch-py35 -c menpo opencv3
RUN conda install --name pytorch-py35 -c anaconda scikit-learn=0.18.1
RUN conda install --name pytorch-py35 -c conda-forge pandas=0.20.3
RUN conda install --name pytorch-py35 -c anaconda jupyter
RUN conda install --name pytorch-py35 -c anaconda protobuf=3.2.0
RUN conda install --name pytorch-py35 -c conda-forge python-lmdb

RUN conda install --name pytorch-py35 pytorch=0.4.1 torchvision cuda90 -c pytorch
RUN conda install --name pytorch-py35 -c conda-forge scikit-image


RUN pip3 install wheel
RUN pip3 install visdom
RUN pip3 install h5py
RUN pip3 install leveldb
RUN pip3 install tqdm

RUN echo "export PATH=/opt/conda/envs/pytorch-py35/bin:$PATH" >> /etc/profile
RUN echo "export PYTHONPATH=/opt/conda/envs/lib/python3.5/site-packages:/usr/local/lib/python3.5/dist-packages:$PYTHONPATH" >> /etc/profile
RUN echo "umask 002" >> /etc/profile
WORKDIR /root
