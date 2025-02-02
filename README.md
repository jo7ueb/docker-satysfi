# docker-satysfi

[![Build Status](https://github.com/amutake/docker-satysfi/workflows/build/badge.svg)](https://github.com/amutake/docker-satysfi/actions?query=workflow%3Abuild)
[![Nightly Build Status](https://github.com/amutake/docker-satysfi/workflows/nightly/badge.svg)](https://github.com/amutake/docker-satysfi/actions?query=workflow%3Anightly)

This repository provides docker images for [SATySFi](https://github.com/gfngfn/SATySFi) and [Satyrographos](https://github.com/na4zagin3/satyrographos).

Images are available at [Docker Hub - amutake/satysfi](https://hub.docker.com/r/amutake/satysfi/).

| tag                                        | size                                                                                                                 | satysfi version     | satyrographos version | opam          | supported arch   | note                         |
| ------------------------------------------ | -------------------------------------------------------------------------------------------------------------------- | ------------------- | --------------------- | ------------- | ---------------- | ---------------------------- |
| `latest`, `0.0.9-6-ge0304803`              | ![badge](https://img.shields.io/docker/image-size/amutake/satysfi/latest?color=black&label=%20&logo=docker)          | `0.0.9-6-ge0304803` | `0.0.2.13`            | o             | `amd64`, `arm64` |                              |
| `slim`, `0.0.9-6-ge0304803-slim`           | ![badge](https://img.shields.io/docker/image-size/amutake/satysfi/slim?color=black&label=%20&logo=docker)            | `0.0.9-6-ge0304803` | `0.0.2.13`            | x             | `amd64`, `arm64` |                              |
| `opam-slim`, `0.0.9-6-ge0304803-opam-slim` | ![badge](https://img.shields.io/docker/image-size/amutake/satysfi/opam-slim?color=black&label=%20&logo=docker)       | `0.0.9-6-ge0304803` | `0.0.2.13`            | o (minimized) | `amd64`, `arm64` | **EXPERIMENTAL**             |
| `0.0.8`                                    | ![badge](https://img.shields.io/docker/image-size/amutake/satysfi/0.0.8?color=black&label=%20&logo=docker)           | `0.0.8`             | `0.0.2.11`            | o             | `amd64`, `arm64` |                              |
| `0.0.8-slim`                               | ![badge](https://img.shields.io/docker/image-size/amutake/satysfi/0.0.8-slim?color=black&label=%20&logo=docker)      | `0.0.8`             | `0.0.2.11`            | x             | `amd64`, `arm64` |                              |
| `0.0.8-opam-slim`                          | ![badge](https://img.shields.io/docker/image-size/amutake/satysfi/0.0.8-opam-slim?color=black&label=%20&logo=docker) | `0.0.8`             | `0.0.2.11`            | o (minimized) | `amd64`, `arm64` | **EXPERIMENTAL**             |
| `nightly`                                  | ![badge](https://img.shields.io/docker/image-size/amutake/satysfi/nightly?color=black&label=%20&logo=docker)         | master branch       | master branch         | x             | `amd64`          | built at 00:00 UTC every day |

## How to use

```console
$ docker run --rm -v $(pwd):/satysfi amutake/satysfi:${TAG} satysfi demo.saty
```

latest and opam-slim tag:

```console
$ docker run --rm -v $(pwd):/satysfi amutake/satysfi:${TAG} \
    sh -c "opam update && opam install satysfi-base && satyrographos install && satysfi demo.saty"
```

nightly tag:

```console
$ docker run --rm amutake/satysfi:nightly cat /satysfi-revision
v0.0.3-397-g6137f5c
$ docker run --rm amutake/satysfi:nightly cat /satyrographos-revision
v0.0.1.6-4-geaf14c8
$ docker run --rm amutake/satysfi:nightly cat /build-date
2019-04-19T00:00:00+00:00
```
