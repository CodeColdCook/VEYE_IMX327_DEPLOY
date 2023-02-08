# VEYE_IMX_DEPLOY

veye相机在JetsonNX上部署使用的方法，目前仅在jetpack5.0上完成测试

## 部署须知

VEYE_IMX_DEPLOY仓库只适用于部分版本的Jetpack，参考如下

- **[nvidia_jetson_veye_bsp](https://github.com/veyeimaging/nvidia_jetson_veye_bsp)**
- **[Jetson Linux Package](https://developer.nvidia.com/embedded/jetson-linux)**
- **[详细部署教程](http://wiki.veye.cc/index.php/VEYE_CS_Camera_for_Jetson_TX2/zh)** 

## 适用版本  

- 相机：VEYE IMX327，VEYE IMX327s
- [Jetson Linux 35.1](https://developer.nvidia.com/embedded/jetson-linux-r351)

## 部署方法

### 1. Jetson NX刷机

- 参考[Nvidia-Jetson-Tutorial](https://e.gitee.com/csc105/repos/csc105/nvidia-jetson-tutorial/tree/master)中的EMMC版Jetson NX 刷机教程

### 2. VEYE相机驱动部署

1. 将部署文件拷贝至NX中，如/home/nvidia/VEYE_IMX_DEPLOY

2. 在运行部署脚本`deploy_imx327_on_jp502.sh`

   ```shell
   $ cd /home/nvidia/VEYE_IMX_DEPLOY
   $ ./deploy_imx327_on_jp502.sh
   [sudo] password for nvidia: 【输入密码】
   ```

3. 重启板卡

   ```shell
   $ sudo reboot
   ```

4. 重启后检查部署结果

   ```shell
   $ cd /home/nvidia/VEYE_IMX_DEPLOY
   $ ./check_deploy.sh
   ```
   
5. 部署成功后，预览相机视频，进行镜头对焦

   相机对焦需以10~20米范围为目标场景，调整相机镜头至图像中场景轮廓清晰

## 扩展

### 更改方法

根据**[详细部署教程](http://wiki.veye.cc/index.php/VEYE_CS_Camera_for_Jetson_TX2/zh)**中的说明进行**Jetpack**刷写、系统**Image**更新、系统**Image.sig**更新、系统**dtb**更新。

