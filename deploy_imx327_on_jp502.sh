#!/bin/bash
SOURCE_FOLD="VEYE_IMX_DEPLOY"
SOURCE_PATH=${HOME}/${SOURCE_FOLD}
cd ${SOURCE_PATH}

# install modules
echo "*** deploy camera moudle *** "
sudo cp -f 5.10.104-tegra/* /lib/modules/5.10.104-tegra/kernel/drivers/media/i2c/
sudo depmod 
echo "*** deploy camera moudle successful *** "
# update dtb_file
echo "*** update dtb_file *** "
sudo cp -rf VEYE-MIPI-CAM2M/ /boot/veyecam
echo "*** update dtb_file successful *** "

# back up extlinux.conf
echo "*** update extlinux.conf *** "
sudo cp -f /boot/extlinux/extlinux.conf /boot/extlinux/extlinux.conf.bak
# update extlinux.conf
sudo cp -f ./conf/extlinux_jp502_imx327.conf /boot/extlinux/extlinux.conf
echo "*** update extlinux.conf successful *** "

echo "*** please reboot and check *** "
