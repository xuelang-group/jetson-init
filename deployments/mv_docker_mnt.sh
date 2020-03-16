# this scripts works but fraigle, far to be robost
mkdir -p /mnt/ssd
mount /dev/sda1 /mnt/ssd
if grep -q sda1 /etc/fstab ; then
echo find sda1 exist in fstab, do nothing
else
echo add /dev/sda1 mount /mnt/ssd to fstab
echo "/dev/sda1      /mnt/ssd              ext4           defaults">>/etc/fstan
fi


#stop docker
systemctl stop docker
systemctl stop docker.socket
mv /var/lib/docker /mnt/ssd/docker
# backup files
cp /mnt/ssd/docker /mnt/ssd/docker.back$(date +%m_%d)
# link docker files
ln -s /mnt/ssd/docker /var/lib/docker
systemctl start docker
systemctl start docker.socket
