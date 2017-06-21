FROM gliderlabs/alpine:latest
MAINTAINER Joshua Sierles <joshua@joshua.si>

LABEL Description="This is a minimal Linux (Alpine) with GNU Guix package manager" Version="1.0.0"

ENV PATH /root/.guix-profile/bin:$PATH
ENV GUIX_VERSION 0.13.0

RUN apk --no-cache add openssl
RUN wget https://alpha.gnu.org/gnu/guix/guix-binary-0.13.0.x86_64-linux.tar.xz && \
    mv guix-binary-${GUIX_VERSION}.x86_64-linux.tar.xz /root/.guix-binary-${GUIX_VERSION}.x86_64-linux.tar.xz

COPY start-daemon.sh start-daemon.sh
COPY init-daemon.sh init-daemon.sh
COPY init-store.sh init-store.sh
COPY init-profile.sh init-profile.sh
COPY build-for-docker.sh build-for-docker.sh
RUN ./init-profile.sh
RUN ./init-daemon.sh
