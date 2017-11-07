#!/bin/bash
set -xe

REPO="${REPO:-typhoon1986}"

# NOTE: version matches are determined!
sed 's/<baseimg>/7.5-cudnn5-devel-centos6/g' Dockerfile-x86_64 > Dockerfile.tmp
docker build -t ${REPO}/paddle_manylinux_devel:cuda7.5_cudnn5 -f Dockerfile.tmp .
docker push ${REPO}/paddle_manylinux_devel:cuda7.5_cudnn5

sed 's/<baseimg>/8.0-cudnn5-devel-centos6/g' Dockerfile-x86_64 > Dockerfile.tmp
docker build -t ${REPO}/paddle_manylinux_devel:cuda8.0_cudnn5 -f Dockerfile.tmp .
docker push ${REPO}/paddle_manylinux_devel:cuda8.0_cudnn5

sed 's/<baseimg>/8.0-cudnn7-devel-centos6/g' Dockerfile-x86_64 > Dockerfile.tmp
docker build -t ${REPO}/paddle_manylinux_devel:cuda8.0_cudnn7 -f Dockerfile.tmp .
docker push ${REPO}/paddle_manylinux_devel:cuda8.0_cudnn7

sed 's/<baseimg>/9.0-cudnn7-devel-centos6/g' Dockerfile-x86_64 > Dockerfile.tmp
docker build -t ${REPO}/paddle_manylinux_devel:cuda9.0_cudnn7 -f Dockerfile.tmp .
docker push ${REPO}/paddle_manylinux_devel:cuda9.0_cudnn7
