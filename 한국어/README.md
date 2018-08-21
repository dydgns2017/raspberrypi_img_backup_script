# 라즈베리파이 백업 스크립트

## 설명
* 1 <img src="https://user-images.githubusercontent.com/36920367/44411694-1925e900-a5a2-11e8-8f95-12c26387896f.PNG" width="50%" align="center">
라즈베리파이를 사용하면서 한번쯤은 img 파일로 백업을 시도해보셨을겁니다. img 백업을 하실 때 gparted 사용하셨을텐데, gparted를 사용할 경우에 1번 사진과 같은 에러 이미지가 출력이 되는 것을 보셨을겁니다. 해당과 같은 경우에는 최소 사이즈를 넘어가서 출력되는 오류인데 300M ~ 500M 용량의 여유 공간을 남겨두고 다시 Resize 할 경우에는 정상적으로 Resizing이 됩니다. 하지만 이러한 여유 공간을 남겨두고 resizing 한 후 이미지 파일을 만들면 read와 write하는 속도가 여유 공간 만큼 느려지게 됩니다. 완벽하게 resizing을 하는 방법이 없을까 고민을 하다가 해당 스크립트를 만들게 되었습니다. 기능은 굉장히 심플하고 전문 프로그래머가 아니기 때문에 코드들이 뒤죽박죽이지만, 도움이 되길 바랍니다.
* 2 <img src="https://user-images.githubusercontent.com/36920367/44411747-335fc700-a5a2-11e8-8d7a-93c4561cb746.PNG" width="50%" align="center"><img src="https://user-images.githubusercontent.com/36920367/44411751-35298a80-a5a2-11e8-9489-a085735a6f7a.PNG" width="50%" align="center">


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
