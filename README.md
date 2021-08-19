# fix-ntfs-disk
fix fucking ntfs disk on linux
tự động mount ổ đĩa & khắc phục permission denied
#Tự động mount ổ đĩa
B1:Create folder to mount your disks in there
example: media/folderA
B2: edit file fstab
`sudo gedit /etc/fstab`
![fstab file](/images/fstab.png)
add partitions which you want to the last line
example:
`/dev/sda1 /media/folderA ntfs-3g deafaults/ uid=1000 0 0`
in there:
- /dev/sda1 is partition you want mount
- /media/folderA is folder you want to contain this partition
- ntfs-3g is type of partition
- uid=1000 be like the recycle bin, if without this file will cant restore when it deleted 
# Auto fix permission denied
You will need it if you use Windows parallel Linux. When you restart to Linux form Windows you can encounter this case and its quite annoying.
If you dont want auto fix it you just do:
- unmount folder have permission denie
- run command `sudo ntfsfix <path of partition>`
- `sudo mount -a`
