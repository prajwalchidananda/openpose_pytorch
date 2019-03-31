# Openpose
This repo contains the PyTorch version of OpenPose with the associated Dockerfile.

## Running OpenPose using docker

### Install docker
Instructions to install docker are here:
```
https://docs.docker.com/install/linux/docker-ce/ubuntu/
```

### Pull the image
Once docker is installed, you can pull the opencv_pytorch image by doing the following:
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
Once you have a docker image, you can mount OpenPose and run by doing the following:
```
docker run -v /path/to/openpose_pytorch/openpose_pytorch -it openpose_pytorch:latest /bin/bash
cd openpose_pytorch
python demo.py
```

