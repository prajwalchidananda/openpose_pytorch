# OpenPose
This repo contains the PyTorch version of OpenPose with the associated Dockerfile. The model weights for the original OpenPose model are here: [dropbox](https://www.dropbox.com/sh/7xbup2qsn7vvjxo/AABWFksdlgOMXR_r5v3RwKRYa?dl=0). Download and save them here:  /path/to/openpose_pytorch/pytorch-openpose/model

## Running OpenPose using docker

### Clone the repository
```
git clone https://github.com/prajwalchidananda/openpose_pytorch.git
cd /path/to/openpose_pytorch
```

### Install docker
Instructions to install docker are here:
[instructions](https://docs.docker.com/install/linux/docker-ce/ubuntu/)

### Pull the image
Once docker is installed, you can pull the openpose_pytorch image by doing the following:
```
docker pull prajwalchidananda/openpose_pytorch
```
This step typically takes around 40 min to complete.

### Build the docker image
Alternatively, you can build the image on your own by doing the following:
```
cd /path/to/openpose_pytorch
docker build -t openpose_pytorch:latest .
```
The build step typically takes around 20 min to complete.

### Run OpenPose on a single image
Once you have a docker image, you can mount openpose_pytorch and run the demo by doing the following:
```
docker run -v /path/to/openpose_pytorch/pytorch-openpose:/root/pytorch-openpose -it openpose_pytorch:latest /bin/bash
cd pytorch-openpose
python demo.py
```

### Run OpenPose on your webcam in realtime (Ubuntu only, experimental)
To send the webcam stream into docker container, use the device argument when running the docker image. Inorder to display the results, you'll have to provide docker with access to your X server. The following does both of these and starts the webcam demo:
```
docker run -ti --rm \
       -v /path/to/openpose_pytorch/pytorch-openpose:/root/pytorch-openpose \
       --device=/dev/video0 \
       -e DISPLAY=$DISPLAY \
       -v /tmp/.X11-unix:/tmp/.X11-unix \
       openpose_pytorch:latest \
       /bin/bash
cd pytorch-openpose
python demo_webcam.py
```
