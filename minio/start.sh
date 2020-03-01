#!/bin/bash

docker stop minio > /dev/null 2>&1
docker rm minio > /dev/null 2>&1

docker run -d --name minio \
	-v $PWD/data/:/data/ \
	-p 9000:9000 \
	minio/minio:latest server /data/
