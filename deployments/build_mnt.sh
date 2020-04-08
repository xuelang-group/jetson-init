ssd_path=/dev/sda
mkfs.ext4 ${ssd_path}
mkdir -p /mnt/ssd
mount  ${ssd_path} /mnt/ssd
mkdir -p /mnt/ssd/sdcard /mnt/ssd/suanpan
ln -s /mnt/ssd/suanpan /mnt/suanpan
ln -s /mnt/ssd/sdcard /mnt/sdcard

if grep -q sda1 /etc/fstab ; then
echo find sda1 exist in fstab, do nothing
else
echo add  ${ssd_path} mount /mnt/ssd to fstab
echo "${ssd_path}      /mnt/ssd              ext4           defaults">>/etc/fstab
# echo "/dev/sda      /mnt/ssd              ext4           defaults">>/etc/fstab
fi
