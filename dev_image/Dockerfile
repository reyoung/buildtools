# A image for building paddle binaries
# Use cuda devel base image for both cpu and gpu environment
FROM paddlepaddle/paddle_manylinux_devel:cuda7.5_cudnn5
MAINTAINER PaddlePaddle Authors <paddle-dev@baidu.com>

ENV HOME /root
# Use cp27-cp27mu for development by default
ENV LD_LIBRARY_PATH /opt/python/cp27-cp27mu/lib:$LD_LIBRARY_PATH
ENV PATH /opt/python/cp27-cp27mu/bin:$PATH
# Add bash enhancements
COPY root/ /root/

# RUN apt-get update && \
#     apt-get install -y \
#     git python-pip python-dev openssh-server bison libnccl-dev \
#     wget unzip unrar tar xz-utils bzip2 gzip coreutils ntp \
#     curl sed grep graphviz libjpeg-dev zlib1g-dev  \
#     python-matplotlib gcc-4.8 g++-4.8 \
#     automake locales clang-format swig doxygen cmake  \
#     liblapack-dev liblapacke-dev libboost-dev \
#     clang-3.8 llvm-3.8 libclang-3.8-dev \
#     net-tools && \
#     apt-get clean -y


# git credential to skip password typing
RUN git config --global credential.helper store

# Fix locales to en_US.UTF-8
RUN localedef -i en_US -f UTF-8 en_US.UTF-8

# FIXME: due to temporary ipykernel dependency issue, specify ipykernel jupyter
# version util jupyter fixes this issue.
RUN pip install --upgrade pip && \
    pip install -U wheel docopt PyYAML sphinx \
    sphinx-rtd-theme==0.1.9 recommonmark \
    pre-commit ipython==5.3.0 \
    ipykernel==4.6.0 jupyter==1.0.0 \
    opencv-python paddlepaddle

# install paddlepaddle so the requirements are installed
RUN pip uninstall -y paddlepaddle

# To fix https://github.com/PaddlePaddle/Paddle/issues/1954, we use
# the solution in https://urllib3.readthedocs.io/en/latest/user-guide.html#ssl-py2
# RUN apt-get install -y libssl-dev libffi-dev
RUN pip install certifi urllib3[secure]


# Install woboq_codebrowser to /woboq
RUN git clone https://github.com/woboq/woboq_codebrowser /woboq && \
    (cd /woboq \
     cmake -DLLVM_CONFIG_EXECUTABLE=/usr/bin/llvm-config-3.8 \
           -DCMAKE_BUILD_TYPE=Release . \
     make)

RUN yum install -y openssh-server
# Configure OpenSSH server. c.f. https://docs.docker.com/engine/examples/running_ssh_service
RUN mkdir /var/run/sshd
RUN echo 'root:root' | chpasswd
RUN sed -ri 's/^#PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config
EXPOSE 22

# development image default do build work
CMD ["bash", "/paddle/paddle/scripts/docker/build.sh"]

