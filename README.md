# raspberrypi_img_backup_script

## Explanation

You would have had this experience while backing up your Raspberry Pi SD card.

* 1 <img src="https://user-images.githubusercontent.com/36920367/44411694-1925e900-a5a2-11e8-8f95-12c26387896f.PNG" width="50%" align="center">
* 2 <img src="https://user-images.githubusercontent.com/36920367/44411747-335fc700-a5a2-11e8-8d7a-93c4561cb746.PNG" width="50%" align="center">
* 3 <img src="https://user-images.githubusercontent.com/36920367/44411751-35298a80-a5a2-11e8-9489-a085735a6f7a.PNG" width="50%" align="center">

You would have had this experience while backing up your Raspberry Pi SD card. 
When using gparted to img back up, you might encounter with error image such as picture no.1.
This error occurs when compacting size is over-limited than the least set size. 
By remaining 300MB~500MB of storage space, resizing process will function normally.
However, remaining these storage space leads to speed lag of reading and wrting.
Concerning about how to resize perfect made me make this script.
The function is quite starightforward and a bit mixed up cause I’m not a professional programmer, I hope to be helpful.

## Getting Started
* OS : ubuntu or debian .. (etc)
* Prerequisites Program : nothing..

## HOW TO USE


## Authors
* **Yonghoon Jung** - *University : Sunkyul Univ* -
* **Seungwon Lee** - *University : Korea Univ* -

## reference
* https://raspberrypi.stackexchange.com/questions/499/how-can-i-resize-my-root-partition
* https://github.com/RPi-Distro/raspi-config/blob/master/raspi-config
