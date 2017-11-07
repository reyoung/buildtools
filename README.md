# buildtools
Contain dockerfiles for building paddle on different distros, cuda versions etc.

Borrowed scripts from https://github.com/numenta/manylinux to build manylinux build environments
based on different versions of CUDA and CUDNN base images, so that we can build PaddlePaddle
using these images to release different versions of PaddlePaddle binaries.

**IMPORTANT** Since this version of manylinux1_x86_64 is based on centos-6 (instead of centos-5), it is technically non-compliant with manylinux1 policy of https://www.python.org/dev/peps/pep-0513/, which requires centos-5 system libraries. However, as suggested in discussions https://mail.python.org/pipermail/wheel-builders/2016-July/000175.html, the wheels produced with the centos-6-based image should still be compatible with many distros (except centos-5), and a future manylinux2 policy may indeed be based on centos-6 as well.

## build and push these images

Run the following commands to build these images and push to your reponsitory. Or just use my initial build at: https://hub.docker.com/r/typhoon1986/paddle_manylinux_devel/tags/

```bash
cd manylinux
REPO=[yourrepo] bash build_all.sh
```
