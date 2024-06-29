#! /bin/bash
sudo yum install lvm2 -y
sudo pvcreate /dev/xvdb
sudo vgcreate ebs_vg
sudo vgcreate ebs_vg /dev/xvdb
sudo lvcreate -l 100%FREE -n ebs_lv ebs_vg
sudo mkfs -t xfs /dev/mapper/ebs_vg-ebs_lv 
sudo mkdir -p /ebs_disk
sudo mount /dev/mapper/ebs_vg-ebs_lv /ebs_disk/