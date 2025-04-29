#!/bin/bash

# Overlaying ROS Workspaces
ROS2_SH=/opt/ros/foxy/setup.bash
VESC_SH=/vesc_ws/install/setup.bash
MXCK_SH=/mxck2_ws/install/setup.bash


# setup ros2 environment
source $ROS2_SH
echo "sourcing $ROS2_SH"

# setup vesc environment
source $VESC_SH
echo "sourcing $VESC_SH"

# build mxck environment
if test ! -f "$MXCK_SH"; then
    colcon build --symlink-install
fi

# setup mxck environment
source $MXCK_SH
echo "sourcing $MXCK_SH"
    
exec "$@"
