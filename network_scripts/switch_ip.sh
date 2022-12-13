#!/bin/bash
# 2022 Martin Cerven
# easily switch between localhost and 10.42.*.* networks

# either run as:
#   bash -i switch_ip.sh 
# or
# we assume user has turned of checking if script is run as interactive
# https://stackoverflow.com/questions/43659084/source-bashrc-in-a-script-not-working

source ~/.bashrc

# check if variable exists, if not, add it at the end of bashrc
if [ -z ${CURRENT_IP:+x} ]; then
  echo "UNSET"
  echo "export CURRENT_IP="remote"">> ~/.bashrc  
  source ~/.bashrc
else
    :
fi




if [ "$CURRENT_IP" = "localhost"  ];
then
    sed -i 's/export CURRENT_IP=.*/export CURRENT_IP="remote"/g' ~/.bashrc
    set_my_ip $(ifconfig | grep -o 10.42.0.*  | awk -F ' ' '{print $1}') 
elif [ "$CURRENT_IP" = "remote"  ];
then
    sed -i 's/export CURRENT_IP=.*/export CURRENT_IP="localhost"/g' ~/.bashrc
    set_my_ip localhost 
else
    :
fi



