# base image https://hub.docker.com/_/python
FROM python:3.8-slim-buster

# install linux system dependencies
RUN apt-get update && apt-get install wget build-essential cmake libfreetype6-dev pkg-config libfontconfig-dev libjpeg-dev libopenjp2-7-dev -y

# install poppler package
RUN wget https://poppler.freedesktop.org/poppler-data-0.4.9.tar.gz \
    && tar -xf poppler-data-0.4.9.tar.gz \
    && cd poppler-data-0.4.9 \
    && make install \
    && cd .. \
    && wget https://poppler.freedesktop.org/poppler-20.08.0.tar.xz \
    && tar -xf poppler-20.08.0.tar.xz \
    && cd poppler-20.08.0 \
    && mkdir build \
    && cd build \
    && cmake .. \
    && make \
    && make install \
    && ldconfig

# set working directory
WORKDIR /app

# copy python app
COPY root/requirements.txt requirements.txt
COPY root/app.py app.py

# install python dependencies
RUN pip3 install -r requirements.txt

