# fix-ntfs-disk
fix fucking ntfs disk on linux

Auto mount partition & Auto fix permission denied
# Auto mount partition

Create folder to mount your disks in there

Example: `mkdir /media/folderA`

Edit file fstab
`sudo gedit /etc/fstab`
![fstab file](/images/fstab.png)

Add partitions which you want to the last line

Example:
`/dev/sda1 /media/folderA ntfs-3g deafaults/ uid=1000 0 0`
in there:
- `/dev/sda1` is partition you want mount
- `/media/folderA` is folder you want to contain this partition (folder you created above)
- `ntfs-3g` is type of partition
- `uid=1000` be like the recycle bin, if without this file will cant restore when it deleted 
# Auto fix permission denied

You will need it if you use Windows parallel Linux. When you restart to Linux form Windows you can encounter this case and its quite annoying.

### If you dont want auto fix it you just do:

- unmount folder have permission denie
- run command `sudo ntfsfix <path of partition need fix>`
- `sudo mount -a`

### If you want auto it:

Create sh file

`sudo nano /usr/local/bin/fix-ntfs-disk.sh`

write it:

``` bash
#!/bin/bash

printf "Start\n" >> /home/fix-ntfs-disk-log.txt
date >> /home/fix-ntfs-disk-log.txt
umount /dev/your-partition |& tee -a /home/fix-ntfs-disk-log.txt
ntfsfix /dev/your-partition |& tee -a /home/fix-ntfs-disk-log.txt
printf "End\n_____________\n\n" >> /home/fix-ntfs-disk-log.txt
```

![sh file](/images/sh-file.png)

Create service file

`sudo nano /etc/systemd/system/fix-ntfs-disk.service`
and write it:
```
[Unit]
After=network.service

[Service]
ExecStart=/usr/local/bin/fix-ntfs-disk.sh

[Install]
WantedBy=default.target
```

![service file](/images/service-file.png)

Set appropriate permissions for both, the Systemd service unit and script:

`sudo chmod 744 /usr/local/bin/fix-ntfs-disk.sh
sudo chmod 664 /etc/systemd/system/fix-ntfs-disk.sh
`
Next enable the service unit:

`sudo systemctl daemon-reload
sudo systemctl enable fix-ntfs-disk.service
`

Now you are ready to reboot your system. Once the system boots you should see the following file containing the log in your `/home`
directory:

`sudo ls /home/fix-ntfs-disk-log.txt`

If its success you can see something like: 

![Log](/images/log.png)
