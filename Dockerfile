FROM debian:bullseye-slim

RUN apt-get update \
 && apt-get install -y curl \
 && rm -rf /var/lib/apt/lists/*

ARG GRAAL_VERSION

ADD https://get.graalvm.org/jdk /installer.sh
RUN chmod +x /installer.sh \
 && bash /installer.sh --no-progress --to "/opt" "${GRAAL_VERSION}" \
 && mv /opt/${GRAAL_VERSION} /opt/graalvm

ENTRYPOINT ["/opt/graalvm/bin/native-image"]
CMD ["--help"]
