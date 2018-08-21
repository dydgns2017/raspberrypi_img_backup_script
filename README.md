# raspberrypi_img_backup_script

## Explanation

* 1 <img src="https://user-images.githubusercontent.com/36920367/44411694-1925e900-a5a2-11e8-8f95-12c26387896f.PNG" width="50%" align="center">
* 2 <img src="https://user-images.githubusercontent.com/36920367/44411747-335fc700-a5a2-11e8-8d7a-93c4561cb746.PNG" width="50%" align="center">
* 3 <img src="https://user-images.githubusercontent.com/36920367/44411751-35298a80-a5a2-11e8-9489-a085735a6f7a.PNG" width="50%" align="center">

I hope you should have tried back up img file while using raspberry pi. 
When you use ‘gparted’ to back up img file, you might encounter with error image such as picture no.1.
This error occurs when compacting size is over-limited than the least set size. 
By remaining 300MB~500MB of storage space, resizing process will work normally.
However, remaining these storage space leads to speed lag of reading and writing.
Concerning about how to resize perfect made me write this script.
Although the function is quite straightforward and a bit mixed up cause I’m not a professional programmer, I hope to be helpful.

If you use this script to create a Raspberry pie backup image file, you can create an image file that is more efficient than gparted by creating an image file with 1 to 0.5% free space as shown in pictures 2 and 3. In addition, auto resizing function is also written to the script when booting SD card, so you do not need to resize the partition using raspi-config after booting.

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
