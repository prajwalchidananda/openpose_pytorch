# OpenPose
This repo contains the PyTorch version of OpenPose with the associated Dockerfile. The model weights for the original OpenPose model are here: [dropbox](https://www.dropbox.com/sh/7xbup2qsn7vvjxo/AABWFksdlgOMXR_r5v3RwKRYa?dl=0). Download and save them here:  /path/to/openpose_pytorch/pytorch-openpose/model

## Running OpenPose using docker

### Install docker
Instructions to install docker are here:
https://docs.docker.com/install/linux/docker-ce/ubuntu/

### Pull the image
Once docker is installed, you can pull the openpose_pytorch image by doing the following:
```
docker pull prajwalchidananda/openpose_pytorch
```

### Build the docker image
Alternatively, you can build the image on your own by doing the following:
```
cd /path/to/openpose_pytorch
docker build -t openpose_pytorch:latest .
```
The build step typically takes around 20 min to complete.

### Run OpenPose
Once you have a docker image, you can mount openpose_pytorch and run the demo by doing the following:
```
docker run -v /path/to/openpose_pytorch/pytorch-openpose:/root/pytorch-openpose -it openpose_pytorch:latest /bin/bash
cd pytorch-openpose
python demo.py
```

