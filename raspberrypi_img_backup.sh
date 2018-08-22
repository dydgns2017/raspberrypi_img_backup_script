#!/bin/bash
## Create RPi Backup img file
## By. Yonghoon Jung

## variable list
#  backupDir
#  imgFilename
#  piDev
#  used
#  endofsector
#  temp

## backup .img file Directory config

echo "configuration..."

gitdir=${PWD}

if [ ! -d $HOME"/backupfiles" ]
then
mkdir $HOME/backupfiles
backupDir=$HOME"/backupfiles"
fi

if [ ! -n "$1" ]
then
        echo "Error, input the Raspberry Pi SD card Device information ex) sudo bash *.sh /dev/sdb" && exit 1
fi

if [ -n "$2" ]
then
        imgFilename=$2 ## img file name config
else
        ## default
        imgFilename=RPibackup.img
fi

piDev=$1 ## Rasberry pi SD card config

##umount##
mountCheck=$(mount -l | grep $piDev | awk {'print $2'})

if [ "$mountCheck" = "on" ]
then
        sudo sh -c "umount $piDev"  || sudo umount $piDev'2'
        if [ ! $? == 0 ]; then
                echo "Error, unmount point is Wrong! You should be unmount your raspberry pi SD card Device directly!!"
                exit 1
        fi
fi

##########

cd /

if [ -d /media ] ## mount location config
then
        cd /media
else
        sudo mkdir /media
        cd /media
fi

if [ ! -d /media/pi ]
then
        sudo mkdir pi
fi

if [ ! -d /media/pim ]
then
        sudo mkdir pim
fi

sudo mount -t ext4 $piDev'2' /media/pi
cd /media/pi

## Filemove pi to pim
echo "File moving...(pi to pim)"
used=$(df -k | grep media | awk {'print $3'})
((used=${used}*1024/512)) ## sector
((used=${used}+34816)) ## 17MB add..
temp=$(sudo du -ks ./var | awk {'print $1'})
((temp=${temp}*1024/512/2))
((used=${used}+${temp}))

if [ ! -n $used ]
then
        echo "Error, user variable not set..!" && exit 1
fi

sudo mv ./* ../pim/ && echo "success file move" && cd /media
sudo umount /media/pi

##resize Partition
(
echo d
echo 2
echo n
echo p
echo 2
echo 98304 ## .. Things to fix later
echo +$used
echo w
) | sudo fdisk $piDev
if [ ! $? == 0 ]; then
        echo "Error, fdisk.."
        exit 1
fi
sudo e2fsck -f -y -v -C 0 $piDev'2'
(
echo y
) | sudo mkfs.ext4 $piDev'2'

##Filemove pim to pi
sudo mount -t ext4 $piDev'2' /media/pi
cd /media/pi && sudo rm -rf ./*
echo "File moving...(pim to pi)"
cd /media/pim
sudo mv ./* ../pi/ && echo "success file move" && cd /media

## SD card autoresize config
sudo cp $gitdir'/autoresize.sh' ./pi/home/pi/autoresize.sh
sudo cp ./pi/etc/rc.local ./pi/etc/rc.local.orig
sudo cp $gitdir'/rc.local' ./pi/etc/rc.local
sudo umount /media/pi

##create backup img file
echo "create backup img file.."
endofsector=$(sudo fdisk -l $piDev | grep $piDev'2' | awk {'print $3'})

if [ ! -n $endofsector ]
then
        echo "Error, endofsector variable not set..!" && exit 1
fi

cd $HOME/backupfiles/
sudo dd if=$piDev of=$HOME/backupfiles/$imgFilename bs=512 count=$endofsector

if [ $? == 0 ]; then
        echo "Success!.."
        cd $HOME/backupfiles
        ls -al | grep $imgFilename
else
        echo "Error, Flash read Faild!" && exit 1
fi
