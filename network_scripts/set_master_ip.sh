#!/bin/bash
# 2022 Martin Cerven
# Set networking variables for ROS and Gazebo using ~/.bashrc
echo $1

if grep -q ROS_MASTER_URI ~/.bashrc; then
    echo "ROS_MASTER_URI already exists, overwriting..."
    sed -i 's/export ROS_MASTER_URI=.*/export ROS_MASTER_URI=http:\/\/'"$1"':11311/g' ~/.bashrc

else
    echo "DOES NOT HAVE SET  ROS_MASTER_URI!, setting..."
    echo 'export ROS_MASTER_URI=http://'$1':11311/'>> ~/.bashrc
fi


# GAZEBO_MASTER_URI=http://localhost:11345

if grep -q GAZEBO_MASTER_URI ~/.bashrc; then
    echo "GAZEBO_MASTER_URI already exists, overwriting..."
    sed -i 's/export GAZEBO_MASTER_URI=.*/export GAZEBO_MASTER_URI=http:\/\/'"$1"':11345/g' ~/.bashrc

else
    echo "DOES NOT HAVE SET  GAZEBO_MASTER_URI!, setting..."
    echo 'export GAZEBO_MASTER_URI=http://'$1':11345/'>> ~/.bashrc
fi

source ~/.bashrc
