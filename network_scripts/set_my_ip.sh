#!/bin/bash
# 2022 Martin Cerven
# Set networking variables for ROS and Gazebo using ~/.bashrc
echo $1

if grep -q ROS_IP ~/.bashrc; then
    echo "ROS_IP already exists, overwriting..."
    sed -i 's/export ROS_IP=.*/export ROS_IP='"$1"'/g' ~/.bashrc

else
    echo "DOES NOT HAVE SET  ROS_IP!, setting..."
    echo 'export ROS_IP='$1'/'>> ~/.bashrc
fi


# ROS_HOSTNAME=http://localhost:11345

if grep -q ROS_HOSTNAME ~/.bashrc; then
    echo "ROS_HOSTNAME already exists, overwriting..."
    sed -i 's/export ROS_HOSTNAME=.*/export ROS_HOSTNAME='"$1"'/g' ~/.bashrc

else
    echo "DOES NOT HAVE SET  ROS_HOSTNAME!, setting..."
    echo 'export ROS_HOSTNAME='$1'/'>> ~/.bashrc
fi

source ~/.bashrc
