ssd_path=/dev/sda
mkfs.ext4 ${ssd_path}
mkdir -p /mnt/ssd
mount  ${ssd_path} /mnt/ssd
mkdir -p /mnt/ssd/global/configs/suanpan-rocket
mkdir -p /mnt/ssd/suanpan
ln -s /mnt/ssd/suanpan /mnt/suanpan
ln -s /mnt/ssd/global /mnt/global

uuid=$(lsblk ${ssd_path} -o UUID -n)
if grep -q ssd /etc/fstab ; then
echo find /mnt/ssd exist in fstab, do nothing
else
echo add  ${uuid} mount /mnt/ssd to fstab
echo "UUID=${uuid}      /mnt/ssd              ext4           defaults">>/etc/fstab
# echo "/dev/sda      /mnt/ssd              ext4           defaults">>/etc/fstab
fi
