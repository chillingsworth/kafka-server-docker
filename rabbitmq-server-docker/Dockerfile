FROM ubuntu:18.04
FROM python:3.9.15
FROM rabbitmq:3.11.9-alpine

COPY ./ /app

WORKDIR /app

CMD make unzip; make -j4 start-zookeeper start-server; make create-topic