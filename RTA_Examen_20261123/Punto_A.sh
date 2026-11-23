#!/bin/bash
   34  sudo lsblk
   35  sudo fdisk /dev/sdd
   36  fdisk /dev/sdc
   37  sudo fdisk /dev/sdc
   38  sudo fdisk -l
   39  sudo pvcreate /dev/sdd1 /dev/sdd2
   40  sudo pvcreate /dev/sdc1
   41  sudo vgcreate vg_datos /dev/sdd1 /dev/sdd2
   42  sudo vgremove vg_datos
   43  sudo vgcreate vg_datos /dev/sdc1 /dev/sdd1
   44  sudo vgcreate vg_temp /dev/sdd2
   45  sudo vgs
   46  sudo vgremove vg_datos vg_temp
   47  sudo vgcreate vg_temp /dev/sdc1
   48  sudo vgcreate vg_datos /dev/sdd1 /dev/sdd2
   49  sudo vgs
   50  sudo lvcreate -L +484M vg_temp -m lv_swap
   51  sudo lvcreate -L +480M vg_temp -m lv_swap
   52  sudo lvcreate -L +480M vg_temp -n lv_swap
   53  sudo lvcreate -L +5M vg_datos -n lv_docker
   54  sudo lvcreate -L ALL vg_datos -n lv_workareas
   55  sudo lvcreate -l +100%FREE vg_datos -n lv_workareas
   56  sudo fdisk -l
   57  sudo mkfs.ext4 /dev/mapper/vg_datos-lv_workareas
   58  sudo mkfs.ext4 /dev/mapper/vg_datos-lv_docker
   59  sudo mkfs.ext4 /dev/mapper/vg_temp-lv_swap
   60  sudo mkswap /dev/mapper/vg_temp-lv_swap
   61  sudo mount /dev/mapper/vg_datos-lv_docker /var/lib/docker/
   62  ls -h
   63  df -h
   64  cd /
   65  ls
   66  sudo mkdir work
   67  sudo mount /dev/mapper/vg_datos-lv_workareas /work/
   68  df -h
   69  sudo swapon /dev/mapper/vg_temp-lv_swap
   70  df -h
   71  free -h
   72  history -a
   73  ls -la \~/RTA\_Examen\_$(date +%Y%m%d)/
   74  sudo ls -la \~/RTA\_Examen\_$(date +%Y%m%d)/
   75  history
   76  free -h
   77  vgs
   78  sudo vgs
   79  sudo mkswap /dev/mapper/vg_temp-lv_swap
   80  sudo mount /dev/mapper/vg_datos-lv_workareas /work/
   81  sudo mount /dev/mapper/vg_datos-lv_docker /var/lib/docker/
   82  sudo vgs
   83  df -h
   84  free -h
   85  sudo swapon /dev/mapper/vg_temp-lv_swap
   86  free -h

