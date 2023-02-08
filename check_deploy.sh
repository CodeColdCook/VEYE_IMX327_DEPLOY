#!/bin/bash

TARGET_DRIVER="veyecam"
TARGET_DEVICE="veyecam"

# check image and driver 
echo "Check Image update status..."
DRIVERS=` ls /sys/bus/i2c/drivers `
result=$(echo $DRIVERS | grep "${TARGET_DRIVER}")
if [ "$result" != "" ]
then
    echo "- - - camera moudle deploy success"
else
    echo "- - - camera moudle deploy update failed"
    echo "      no any ${TARGET_DRIVER} found in /sys/bus/i2c/drivers"
fi

# check dtb and device
echo "Check DTB update status..."
DEVICES=` ls /proc/device-tree/cam_i2cmux/i2c@* `
result=$(echo $DEVICES | grep "${TARGET_DEVICE}")
if [ "$result" != "" ]
then
    echo "- - - DTB update success"
else
    echo "- - - DTB update failed"
    echo "      no any ${TARGET_DEVICE} found in /proc/device-tree/cam_i2cmux/i2c@*"
fi

# test pipeline 
echo "Use below commond for checking the camera vedio capture ↓↓↓"
echo "  gst-launch-1.0 nvv4l2camerasrc device=/dev/video0 ! "video/x-raw(memory:NVMM),format=(string)UYVY, width=(int)1920, height=(int)1080" ! nvvidconv ! "video/x-raw(memory:NVMM),format=(string)I420" ! nv3dsink sync=false"
