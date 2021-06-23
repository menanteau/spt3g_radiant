# Create the spt group
sudo groupadd spt

# Create new user
sudo su -
export NEWUSER=newuser
adduser $NEWUSER
# To add the to sudo group
usermod -aG wheel $NEWUSER
usermod -aG spt $NEWUSER
passwd $NEWUSER

# Allow passwd for sshd -- only in case needed!!! Use ssh keys instead
# Edit /etc/ssh/sshd_config to allows passwd login
# uncomment the line: #PasswordAuthentication yes'

# To mount the NFS volume:
sudo mkdir /data
sudo mount -t nfs radiant-nfs.ncsa.illinois.edu:/radiant/projects/bbfl /data

# For permanent mounting, edit /etc/fstab
radiant-nfs.ncsa.illinois.edu:/radiant/projects/bbfl /data        nfs     defaults        0 0

# Change the permissions:
chmod a+rx data

# Create a partition for SPT
mkdir /data/spt3g
chgrp spt /data/spt3g
chmod g+wrx /data/spt3g

# to allow passwordless sudo
sudo visudo
# and then uncomment:
%wheel ALL=(ALL) NOPASSWD: ALL

# Create the spt group
sudo groupadd spt

# Add fpack
sudo yum -y install epel-release
sudo yum -y install fpack
# wget
sudo yum -y install wget
