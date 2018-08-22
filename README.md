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

If you use this script to create a Raspberrypi backup image file, you can create an image file that is more efficient than gparted by creating an image file with 1 to 0.5% free space as shown in pictures 2 and 3. In addition, auto resizing function is also written to the script when booting SD card, so you do not need to resize the partition using raspi-config after booting.

## Getting Started
* OS : ubuntu or debian .. (etc)
* Prerequisites Program : nothing..

We recommend that you run the script in Ubuntu because it was created in the default environment. Or you can look at the script and think about installing the required programs yourself.

## HOW TO USE

Care point! Before downloading and running  this script, make sure you back up in advance with a proven method!

Import the script into the git clone.

```
git clone https://github.com/dydgns2017/raspberrypi_img_backup_script.git
cd raspberrypi_img_backup_script
```

Before using the script, make sure that flash memory is plugged <br/>
in and check the memory device name through the fdisk command as follows:

```
sudo fdisk -l 
```

ex ) print

```
Disk /dev/sdb: 14.9 GiB, 15931539456 bytes, 31116288 sectors
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disklabel type: dos
Disk identifier: 0x86310bac

Device     Boot Start     End Sectors  Size Id Type
/dev/sdb1        8192   96663   88472 43.2M  c W95 FAT32 (LBA)
/dev/sdb2       98304 4138976 4040673  1.9G 83 Linux
```

Remember the name of the printed memory device and run the script by <br/>
specifying the device name and image file name as factor values.

```
sudo bash raspberrypi_img_backup.sh /dev/xxx xxx.img
```

ex ) excute script

```
sudo bash raspberrypi_img_backup.sh /dev/sdb Raspberrypi.img
```

After the entire script finishes, <br/>verify that the disk is normally written with the command:

```
sudo fdisk -l
```

ex ) print

```
Device     Boot Start     End Sectors  Size Id Type
/dev/sdb1        8192   96663   88472 43.2M  c W95 FAT32 (LBA)
/dev/sdb2       98304 4138976 4040673  1.9G 83 Linux
```

Image backups are set to $HOME/backupfiles by default, <br/> so go into the directory to see if the image backup was successful.

```
cd $HOME/backupfiles
ls -alh

ex ) print
-rw-r--r--  1 root       root       2.0G  8월 21 23:04 homes.img
-rw-r--r--  1 root       root       2.7G  8월 21 12:11 RPibackup.img
-rw-r--r--  1 root       root       2.0G  8월 21 13:59 test.img
```

Finally, use the dd command to write the image file <br/>to another SD card to test its performance.

## Authors
* **Yonghoon Jung** - *University : Sunkyul Univ* -
* **Seungwon Lee** - *University : Korea Univ* -

## Reference
* https://raspberrypi.stackexchange.com/questions/499/how-can-i-resize-my-root-partition
* https://github.com/RPi-Distro/raspi-config/blob/master/raspi-config
* https://www.instructables.com/id/How-to-BackUp-and-Shrink-Your-Raspberry-Pi-Image/
* https://github.com/billw2/rpi-clone
