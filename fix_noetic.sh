#!/bin/bash

sudo apt-get update -o APT::Update::Pre-Invoke::='/bin/bash -c "
sudo rm -f /usr/share/keyrings/ros-archive-keyring.gpg &&
curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key | gpg --dearmor | sudo tee /usr/share/keyrings/ros-archive-keyring.gpg > /dev/null &&
curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | sudo apt-key add - &&
curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key | sudo apt-key add - &&
echo \"deb http://packages.ros.org/ros/ubuntu focal main\" | sudo tee /etc/apt/sources.list.d/ros-latest.list > /dev/null &&
echo \"deb [arch=amd64 signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu focal main\" | sudo tee /etc/apt/sources.list.d/ros2.list > /dev/null
"'

sudo apt-get update

exit

