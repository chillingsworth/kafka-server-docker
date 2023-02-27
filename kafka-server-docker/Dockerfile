FROM ubuntu:18.04
FROM python:3.9.15

COPY ./ /app

WORKDIR /app

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive \
    apt-get -y install default-jre-headless && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

CMD make unzip; make -j4 start-zookeeper start-server; make create-topic