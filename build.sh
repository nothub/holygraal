#!/usr/bin/env sh

set -e

image_name="n0thub/holygraal"
graal_version="22.3.2"

docker build --build-arg "GRAAL_VERSION=graalvm-ce-java17-${graal_version}" \
    -t "${image_name}:${graal_version}" \
    -t "${image_name}:latest" .
