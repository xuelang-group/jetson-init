mkdir -p /mnt/ssd
mount /dev/sda1 /mnt/ssd
if grep -q sda1 /etc/fstab ; then
echo find sda1 exist in fstab, do nothing
else
echo add /dev/sda1 mount /mnt/ssd to fstab
echo "/dev/sda1      /mnt/ssd              ext4           defaults">>/etc/fstab
# echo "/dev/sda      /mnt/ssd              ext4           defaults">>/etc/fstab
fi
