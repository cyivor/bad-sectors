# bad-sectors
forcefully generate bad sectors on your (simulated) img by corrupting specific sectors

<sup>note: qemu does usually come native to any average linux installation but not everything is installed along with it, make sure you have the correct dependencies</sup>

## Instructions

### Suggested
- Run `smartctl` against the device before inducing the bad sectors (step 3) to record attributes of the loop device to compare the aftermath

1. Create a virtual test image
```
qemu-img create -f raw changeNameIfYouWant.img 1G
```

2. Mount virtual disk image
<sup>note: may need to change loop number if you already have loop device under that number/name</sup>
```
sudo losetup /dev/loop0 changeNameIfYouWant.img
```

3. Use `dd` to write random/invalid data to the sector range (`1-1000`)
```
sudo dd if=/dev/zero of=/dev/loop0 bs=512 count=1 seek=1000
```

You can also induce possible logic errors by intensive stress testing with `fio` or `badblocks` (`sudo badblocks -v -s -n /dev/loop0`, `sudo fio --name=cyivor --filename=/dev/loop0 --rw=write --bs=4k --size=1G --numjobs=1 --iodepth=1 --runtime=60 --time_based`)