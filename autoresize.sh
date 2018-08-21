#### auto resize script
## reference :  https://github.com/RPi-Distro/raspi-config/blob/master/raspi-config

function errorlog_pi(){
	echo "Error, line : $1" >> /home/pi/resize_errorlog
	exit 1
}

ROOT_PART=$(mount | sed -n 's|^/dev/\(.*\) on / .*|\1|p')
[ "$ROOT_PART" ] || errorlog_pi $LINENO
PART_NUM=${ROOT_PART#mmcblk0p}
[ "$PART_NUM" ] || errorlog_pi $LINENO
PART_START=$(sudo parted /dev/mmcblk0 -ms unit s p | grep "^${PART_NUM}" | cut -f 2 -d: | sed 's/[^0-9]//g')
[ "$PART_START" ] || errorlog_pi $LINENO

(
echo d
echo $PART_NUM
echo n
echo p
echo $PART_NUM
echo $PART_START
echo
echo N
echo w
) | sudo fdisk /dev/mmcblk0 || errorlog_pi $LINENO

cat <<EOF > /etc/init.d/resize2fs_once &&
#!/bin/sh
### BEGIN INIT INFO
# Provides:          resize2fs_once
# Required-Start:
# Required-Stop:
# Default-Start: 3
# Default-Stop:
# Short-Description: Resize the root filesystem to fill partition
# Description:
### END INIT INFO
. /lib/lsb/init-functions
case "\$1" in
  start)
    log_daemon_msg "Starting resize2fs_once" &&
    resize2fs /dev/$ROOT_PART &&
    update-rc.d resize2fs_once remove &&
    rm /etc/init.d/resize2fs_once &&
    log_end_msg \$?
    ;;
  *)
    echo "Usage: \$0 start" >&2
    exit 3
    ;;
esac
EOF
  chmod +x /etc/init.d/resize2fs_once &&
  update-rc.d resize2fs_once defaults &&

## reboot..
reboot
