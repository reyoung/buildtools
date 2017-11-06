#!/bin/bash

REPO="${REPO:-typhoon1986}"

# NOTE: version matches are determined!
docker build -t ${REPO}/paddle_manylinux_devel:cuda7.5_cudnn5 \
--build-arg baseimg=7.5-cudnn5-devel-centos6 \
-f manylinux/Dockerfile-x86_64 manylinux


docker build -t ${REPO}/paddle_manylinux_devel:cuda8.0_cudnn5 \
--build-arg baseimg=8.0-cudnn5-devel-centos6 \
-f manylinux/Dockerfile-x86_64 manylinux

docker build -t ${REPO}/paddle_manylinux_devel:cuda8.0_cudnn7 \
--build-arg baseimg=8.0-cudnn7-devel-centos6 \
-f manylinux/Dockerfile-x86_64 manylinux

docker build -t ${REPO}/paddle_manylinux_devel:cuda9.0_cudnn7 \
--build-arg baseimg=9.0-cudnn7-devel-centos6 \
-f manylinux/Dockerfile-x86_64 manylinux
