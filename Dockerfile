FROM ghcr.io/amutake/satysfi-base-image:opam-2.1.3-ocaml-4.14.0

# Versions
ENV SATYSFI_VERSION=0.0.9-6-ge0304803
ENV SATYROGRAPHOS_VERSION=0.0.2.13

# Setup SATySFi & Satyrographos
RUN opam update
RUN apt-get update \
  && opam install satysfi.${SATYSFI_VERSION} satysfi-dist.${SATYSFI_VERSION} satyrographos.${SATYROGRAPHOS_VERSION} \
  && rm -rf /var/lib/apt/lists/*
RUN opam exec -- satyrographos install

# Setup build directory
RUN mkdir /satysfi
WORKDIR /satysfi

# OCI Annotations (https://github.com/opencontainers/image-spec/blob/main/annotations.md)
ARG BUILD_DATE
ARG VERSION
ARG REVISION
LABEL org.opencontainers.image.created=$BUILD_DATE \
  org.opencontainers.image.authors="amutake" \
  org.opencontainers.image.url="https://github.com/amutake/docker-satysfi" \
  org.opencontainers.image.documentation="https://github.com/amutake/docker-satysfi" \
  org.opencontainers.image.source="https://github.com/amutake/docker-satysfi" \
  org.opencontainers.image.version=$VERSION \
  org.opencontainers.image.revision=$REVISION \
  org.opencontainers.image.vendor="amutake" \
  org.opencontainers.image.licenses="Apache-2.0" \
  org.opencontainers.image.title="SATySFi and Satyrographos image with full opam environment" \
  org.opencontainers.image.description="SATySFi and Satyrographos image with full opam environment" \
  org.opencontainers.image.ref.name="amutake/satysfi:${VERSION}"

# Setup entrypoint
ENTRYPOINT ["opam", "exec", "--"]
