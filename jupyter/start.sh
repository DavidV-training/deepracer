#!/bin/bash

docker stop jupyter > /dev/null 2>&1
docker rm jupyter > /dev/null 2>&1


source sagemaker_venv/bin/activate
docker run -d -p 8888:8888 \
	--name jupyter \
	-v $PWD/work/:/home/jovyan/ \
	jupyter/scipy-notebook:latest
