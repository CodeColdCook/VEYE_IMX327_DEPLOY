# VEYE_IMX_DEPLOY

veye相机在JetsonNX上部署使用的方法，目前仅在jetpack5.0上完成测试

## 部署须知

VEYE_IMX_DEPLOY仓库只适用于部分版本的Jetpack，参考如下

- **[nvidia_jetson_veye_bsp](https://github.com/veyeimaging/nvidia_jetson_veye_bsp)**
- **[Jetson Linux Package](https://developer.nvidia.com/embedded/jetson-linux)**
- **[详细部署教程](http://wiki.veye.cc/index.php/VEYE_CS_Camera_for_Jetson_TX2/zh)**

## 适用版本

- 相机：VEYE IMX327，VEYE IMX327s
- Jetpack：L4T32.7.2（[JetPack 4.6.2](https://developer.nvidia.com/jetpack-sdk-462)），L4T32.7.1（[JetPack 4.6.2](https://developer.nvidia.com/jetpack-sdk-462)）

## 部署方法

### 1. Jetson NX刷机

- 参考[Nvidia-Jetson-Tutorial](https://e.gitee.com/csc105/repos/csc105/nvidia-jetson-tutorial/tree/master)中的EMMC版Jetson NX 刷机教程

- 注意：在执行刷机命令`sudo ./flash.sh p3449-0000+p3668-0001-qspi-emmc mmcblk0p1`之前需将仓库中`cboot_t194.bin`覆盖掉刷机文件中的`Linux_for_Tegra/bootloader/cboot_t194.bin`

### 2. VEYE相机驱动部署

1. 将部署文件拷贝至NX中，如/home/nvidia/VEYE_IMX327_DEPLOY

2. 在运行部署脚本`deploy_imx327_img_dtb.sh`

   ```shell
   $ cd /home/nvidia/VEYE_IMX327_DEPLOY
   $ ./deploy_imx327_img_dtb.sh
   [sudo] password for nvidia: 【输入密码】
   ```

3. 重启板卡

   ```shell
   $ sudo reboot
   ```

4. 重启后检查部署结果

   ```shell
   $ cd /home/nvidia/VEYE_IMX327_DEPLOY
   $ ./check_deploy.sh
   Check Image update status...
   - - - Image and Image.sig update success
   Check DTB update status...
   - - - DTB update success
   Use below commond for checking the camera vedio capture ↓↓↓
     gst-launch-1.0 nvv4l2camerasrc device=/dev/video0 ! "video/x-raw(memory:NVMM),format=(string)UYVY, width=(int)1920, height=(int)1080" ! nvvidconv ! "video/x-raw(memory:NVMM),format=(string)I420" ! nvoverlaysink sync=false
   ```

5. 部署成功后，预览相机视频，进行镜头对焦

   ```shell
   $ gst-launch-1.0 nvv4l2camerasrc device=/dev/video0 ! "video/x-raw(memory:NVMM),format=(string)UYVY, width=(int)1920, height=(int)1080" ! nvvidconv ! "video/x-raw(memory:NVMM),format=(string)I420" ! nvoverlaysink sync=false
   ```

   相机对焦需以10~20米范围为目标场景，调整相机镜头至图像中场景轮廓清晰

## 扩展

### 更改方法

根据**[详细部署教程](http://wiki.veye.cc/index.php/VEYE_CS_Camera_for_Jetson_TX2/zh)**中的说明进行**Jetpack**刷写、系统**Image**更新、系统**Image.sig**更新、系统**dtb**更新。

### 主要更改内容

- Image
- Image.sig
- .dtb
- .conf
- `deploy_imx327_img_dtb.sh`中**DTBNAME**和**CONFNAME**
- 对应的相机型号（命名）

