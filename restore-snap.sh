##DR Restore

!/bin/bash
echo " checking MASTER node"
NUM=$(cat fs-locator)
 ssh -i /Users/kirson/install-files/kirson-bastion-poc.cer ubuntu@18.220.19.54 "sudo weka fs delete default --force ; sudo  weka fs download  default  default 1TiB  1TiB runai-weka-s3 $NUM  ;sudo  umount /mnt/weka ; sudo  mount -t wekafs weka-dr.runai-23.com/default /mnt/weka" &> /dev/null
echo "Validating GPU Nodes... "
ssh -i /Users/kirson/install-files/kirson-bastion-poc.cer ubuntu@13.58.94.152 "sudo  umount /mnt/weka ; sudo  mount -t wekafs weka-dr.runai-23.com/default /mnt/weka" &> /dev/null
echo "Validating  worker node"
ssh -i /Users/kirson/install-files/kirson-bastion-poc.cer ubuntu@3.145.201.87 "sudo  umount /mnt/weka ; sudo  mount -t wekafs weka-dr.runai-23.com/default /mnt/weka" &> /dev/null

