## On-Prem

echo "Preparing Cloud Burst Environment..."
ssh -t -i ~kirson/install-files/kirson-bastion-poc.cer  ubuntu@13.58.142.115 "sudo weka fs snapshot delete default cloud-burst --force" &> /dev/null
sleep 2
ssh -t -i ~kirson/install-files/kirson-bastion-poc.cer  ubuntu@13.58.142.115 "sudo weka fs snapshot create default cloud-burst --access-point cloud-burst"  &> /dev/null
echo "Created  Snapshot  cloud-burst on Production System"
sleep 2
ssh -t -i ~kirson/install-files/kirson-bastion-poc.cer  ubuntu@13.58.142.115 "sudo weka fs snapshot upload default cloud-burst > locator"  &> /dev/null
echo "Syncing cloud-burst snapshot to Cloud Object Storage...."
sleep 2
echo "Waiting for sync to complete ...."
ssh -t -i ~kirson/install-files/kirson-bastion-poc.cer  ubuntu@13.58.142.115 "sudo sh check_sync.sh"  &> /dev/null
sleep 2
echo "Sync Completed - 100% Synced"
scp -i  ~kirson/install-files/kirson-bastion-poc.cer  ubuntu@13.58.142.115:/home/ubuntu/fs-locator ../dr/fs-locator
echo "Weka Storage is ready for RUN.AI Cloud burst"