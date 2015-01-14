cp -rf modules/* /lib/modules/
depmod -a

mkdir /store
MOUNT_STR="//192.168.5.20/Public /store cifs noauto,username=bnb,password=bnb 	0 0"
echo $MOUNT_STR >> /etc/fstab

rm /etc/modules-load.d/g_multi.conf

MODLOAD_CIFS="isofs\nudf\ncifs"
echo -e $MODLOAD_CIFS > /etc/modules-load.d/cifs.conf

cp exec_after_exists /bin/
cp services/* /etc/systemd/system/

systemctl enable $(ls services)
