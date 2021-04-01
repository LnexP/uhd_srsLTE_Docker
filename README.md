# UHD_SRSLTE_DOCKER

Dockerfile for building image with uhd and srsLTE in Docker.

## Build and run
If u meet some network error, you possibly need to use `docker build --build-arg HTTP_PROXY=[PROXY] --build-arg HTTPS_PROXY=[PROXY] --network host [ARGS] [DOCKERFILE]` to build the image, especially if you have a bad Internet connection to Github.

If you are using **ETTUS B series USRP**, using `docker run -it -v /dev:/dev --privileged [ARGS] [IMAGE]` to run the build docker image. For we need to acquire USB device from the host.

If you are using **ETTUS N series USRP**, you possibly need to use port mapping functionality of Docker.

This Dockerfile changes the APT source to SJTUG Ubuntu Source. If you are **not living in China**, you need change the APT source to whatever you like.

I have test this file on a B210 board, it runs correctly.
