ARG CUDA_VERSION=11.7.1
ARG OS_VERSION=ubuntu22.04

FROM nvidia/cuda:${CUDA_VERSION}-base-${OS_VERSION} as nvidia

RUN apt-get -qq update && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
  curl \
  wget \
  tar \
  ca-certificates

  RUN mkdir /rigelminer && wget -O rigel.tar.gz https://github.com/rigelminer/rigel/releases/download/1.18.1/rigel-1.18.1-linux.tar.gz \
    && tar xvf rigel.tar.gz --strip-components 1 -C /rigelminer

ENTRYPOINT ["/rigelminer/rigel"]
