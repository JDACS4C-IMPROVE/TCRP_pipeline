# hash:sha256:98a06c0b620ad4da009cb7dd15f3fe63932db9f06b2f039fb7af3da810c45fb8
FROM registry.acmecorp-edge.codeocean.com/codeocean/miniconda3:4.7.10-cuda10.1-cudnn7-ubuntu18.04

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        curl=7.58.0-2ubuntu3.16 \
        python3-pip=9.0.1-2.3~ubuntu1.18.04.5 \
        python3-setuptools=39.0.1-2 \
        python3-venv=3.6.7-1~18.04 \
        python3-wheel=0.30.0-0.2 \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir /.code-server \
	&& cd /.code-server \
	&& curl -L "https://github.com/coder/code-server/releases/download/v4.0.2/code-server-4.0.2-linux-amd64.tar.gz" -o code-server.tar.gz \
	&& tar -xvf code-server.tar.gz \
	&& rm code-server.tar.gz \
	&& ln -s /.code-server/code-server-4.0.2-linux-amd64/bin/code-server  /usr/bin/code-server

COPY postInstall /
RUN /postInstall
