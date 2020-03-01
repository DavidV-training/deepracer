#!/bin/bash

FILENAME=work/input/log.txt
CONTAINER=dr

rm -rf /tmp/tmp_logs/ > /dev/null 2>&1
mkdir /tmp/tmp_logs/
docker cp $CONTAINER:/root/.ros/log/ /tmp/tmp_logs/
cat /tmp/tmp_logs/log/rl_coach* > $FILENAME
rm -rf /tmp/tmp_logs/

sed -i '/.*SIM_TRACE_LOG.*/!d' $FILENAME
sed -i 's/^.*://' $FILENAME

HEAD='episode,steps,x,y,yaw,steer,throttle,action,reward,done,all_wheels_on_track,progress,closest_waypoint,track_len,timestamp'
sed -i "1s/^/$HEAD\n/" $FILENAME






rm -rf work/tracks/ > /dev/null 2>&1
mkdir work/tracks/
cp ../simulation/aws-robomaker-sample-application-deepracer/simulation_ws/src/deepracer_simulation/routes/*.npy work/tracks/
