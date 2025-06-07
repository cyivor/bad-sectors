rs = openssl rand -base64 12 # idek if this is correct syntax rn im very tired and sleepy
qemu-img create -f raw $rs.img 1G
sudo losetup /dev/loop0 $rs.img
sudo dd if=/dev/zero of=/dev/loop0 bs=512 count=1 seek=1000

# logic errors with stress testing
# sudo badblocks -v -s -n /dev/loop0
# sudo fio --name=cyivor --filename=/dev/loop0 --rw=write --bs=4k --size=1G --numjobs=1 --iodepth=1 --runtime=60 --time_based
