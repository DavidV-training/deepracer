#!/bin/bash

docker stop -t 1 $(docker ps -a -q)
docker rm $(docker ps -a -q)
