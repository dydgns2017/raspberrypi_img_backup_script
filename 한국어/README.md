# 라즈베리파이 백업 스크립트

## 설명

* 1 <img src="https://user-images.githubusercontent.com/36920367/44411694-1925e900-a5a2-11e8-8f95-12c26387896f.PNG" width="50%" align="center">

* 2 <img src="https://user-images.githubusercontent.com/36920367/44411747-335fc700-a5a2-11e8-8d7a-93c4561cb746.PNG" width="50%" align="center">

* 3 <img src="https://user-images.githubusercontent.com/36920367/44411751-35298a80-a5a2-11e8-9489-a085735a6f7a.PNG" width="50%" align="center">

라즈베리파이를 사용하면서 한번쯤은 img 파일로 백업을 시도해보셨을겁니다. img 백업을 하실 때 gparted 사용하셨을텐데, gparted를 사용할 경우에 1번 사진과 같은 에러 이미지가 출력이 되는 것을 보셨을겁니다. 해당과 같은 경우에는 최소 사이즈를 넘어가서 출력되는 오류인데 300M ~ 500M 용량의 여유 공간을 남겨두고 다시 Resize 할 경우에는 정상적으로 Resizing이 됩니다. 하지만 이러한 여유 공간을 남겨두고 resizing 한 후 이미지 파일을 만들면 read와 write하는 속도가 여유 공간 만큼 느려지게 됩니다. 완벽하게 resizing을 하는 방법이 없을까 고민을 하다가 해당 스크립트를 만들게 되었습니다. 기능은 굉장히 심플하고 전문 프로그래머가 아니기 때문에 코드들이 뒤죽박죽이지만, 도움이 되길 바랍니다.

해당 스크립트를 사용하여 라즈베리파이 백업 이미지를 만들면 2, 3번 사진처럼 여유 공간을 1~0.5%로 남기고 이미지 파일을 만들기 때문에 gparted보다 더 효율적인 이미지 파일을 생성할 수 있습니다. 또한 SD카드 부팅시 auto resizing 기능도 스크립트에 써놓았으니, 부팅 후 번거롭게 raspi-config를 이용하여 resizing을 해주실 필요가 없습니다.

## 환경
* 운영체제 : 우분투 혹은 데비안 계열
* 요구되는 프로그램들 : 없음...

해당 스크립트는 우분투에 기본 환경에서 작성되었기 때문에 우분투에서 실행하시는 것을 권장합니다. 혹은 스크립트를 보면서 필요한 프로그램을 직접 설치하는 방법도 있으니 생각해보시길 바랍니다.

## 사용방법

* 주의사항  ! 스크립트를 다운로드 및 실행하기전에 검증된 방법으로 미리 백업을 미리해두시길 바랍니다. !

git clone으로 스크립트를 가져옵니다.

```
git clone https://github.com/dydgns2017/raspberrypi_img_backup_script.git
cd raspberrypi_img_backup_script
```

해당 스크립트를 사용하기전에 flash 메모리가 꽂혀있는지 확인하고 다음과 같이 fdisk 명령어를 통해서 해당 메모리 장치 이름을 확인해주시길 바랍니다.

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

출력된 메모리 장치의 이름을 기억한 뒤 장치명 및 이미지 파일 이름을 인자값으로 지정하여 스크립트를 실행시켜줍니다.

```
sudo bash raspberrypi_img_backup.sh /dev/xxx xxx.img
```

ex ) excute script

```
sudo bash raspberrypi_img_backup.sh /dev/sdb Raspberrypi.img
```

전체적인 스크립트가 종료되면 다음과 같은 명령어로 디스크가 정상적으로 write 되었는지 확인한 후, 라즈베리파이에서 테스트를 해보시길 바랍니다.

```
sudo fdisk -l
```

ex ) print

```
Device     Boot Start     End Sectors  Size Id Type
/dev/sdb1        8192   96663   88472 43.2M  c W95 FAT32 (LBA)
/dev/sdb2       98304 4138976 4040673  1.9G 83 Linux
```

## 작성자
* **정용훈** - *University : Sunkyul Univ* -
* **이승원** - *University : Korea Univ* -

## 참고
* https://raspberrypi.stackexchange.com/questions/499/how-can-i-resize-my-root-partition
* https://github.com/RPi-Distro/raspi-config/blob/master/raspi-config
