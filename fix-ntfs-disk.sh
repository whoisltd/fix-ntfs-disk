#!/bin/bash

printf "Start\n" >> /home/pumpkinduke/fix-ntfs-disk-log.txt
date >> /home/pumpkinduke/fix-ntfs-disk-log.txt
umount /dev/sda3 |& tee -a  /home/pumpkinduke/fix-ntfs-disk-log.txt
ntfsfix /dev/sda3 |& tee -a  /home/pumpkinduke/fix-ntfs-disk-log.txt
mount -a |& tee -a  /home/pumpkinduke/fix-ntfs-disk-log.txt
printf "End\n__________\n\n" >> /home/pumpkinduke/fix-ntfs-disk-log.txt
