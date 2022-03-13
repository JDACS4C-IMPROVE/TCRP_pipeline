# hash:sha256:6770b6129d3eee260920cd41e656f464f37696708ed26fee5575243a268392d8
FROM registry.acmecorp-edge.codeocean.com/codeocean/miniconda3:4.7.10-cuda10.1-cudnn7-ubuntu18.04

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        curl=7.58.0-2ubuntu3.16 \
        libjpeg8-dev=8c-2ubuntu8 \
        python3-pip=9.0.1-2.3~ubuntu1.18.04.5 \
        python3-setuptools=39.0.1-2 \
        python3-venv=3.6.7-1~18.04 \
        python3-wheel=0.30.0-0.2 \
        zlib1g=1:1.2.11.dfsg-0ubuntu2 \
    && rm -rf /var/lib/apt/lists/*

RUN conda install -y \
        jupyterlab==3.2.9 \
    && conda clean -ya

RUN pip install -U --no-cache-dir \
    matplotlib==3.5.1 \
    numpy==1.21.5 \
    pandas==1.3.5 \
    pillow==9.0.1 \
    scipy==1.7.3 \
    sklearn==0.0 \
    torch==1.11.0

RUN pip3 install -U --no-cache-dir \
    numpy==1.19.5 \
    scipy==1.5.4 \
    sklearn==0.0 \
    torch==1.10.2

COPY postInstall /
RUN /postInstall
