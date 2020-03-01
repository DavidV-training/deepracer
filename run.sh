#!/bin/bash

# copy file
sudo cp custom_files/* minio/data/bucket/custom_files

# start minio
cd minio/
./start.sh
cd ..

# start sagemaker
cd rl_coach/
nohup ./start.sh > /dev/null 2>&1 &
cd ..

# wait for sagemaker to start
sleep 60s

# start robomaker
docker run -d --name dr --env-file ./robomaker.env --network sagemaker-local -p 8080:5900 -v $(pwd)/simulation/aws-robomaker-sample-application-deepracer/simulation_ws/src:/app/robomaker-deepracer/simulation_ws/src -v $(readlink -f robo/checkpoint):/root/.ros/ -it crr0004/deepracer_robomaker:console_v1.1 "./run.sh build distributed_training.launch"
