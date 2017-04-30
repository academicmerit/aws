FROM python:3.6-alpine

RUN apk add --no-cache bash

RUN pip install --upgrade pip; pip install -U awscli

RUN adduser -D -u 1000 aws
USER aws
WORKDIR /home/aws
