#!/bin/bash

DTBNAME="tegra194-p3668-all-p3509-0000.dtb"
CONFNAME="extlinux_jp461_imx327.conf"
# cd ${HOME}/IMX327s-jetson-nx-asset/

# back up
sudo cp /boot/Image /boot/Image.bak -f
sudo cp /boot/Image.sig /boot/Image.sig.bak -f

# update 
sudo cp Image /boot/Image -f
sudo cp Image.sig /boot/Image.sig -f

# back up extlinux.conf
sudo cp /boot/extlinux/extlinux.conf /boot/extlinux/extlinux.conf.bak

# update dtb_file
sudo cp -rf VEYE-MIPI-327/ /boot/veyecam
sudo cp ./${CONFNAME} /boot/extlinux/extlinux.conf
