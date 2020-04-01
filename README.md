# ArchFromScratch
My installation from scratch

1. Download Arch ISO and boot
1. Download Arch Linux Fast Installer (https://github.com/MatMoul/archfi)
    ```
    wget archfi.sf.net/archfi
    ```
1. Install Arch
    ```
    sh archfi
    ```
1. Reboot

As root:
```
pacman -S sudo
useradd -G wheel -m <USER>
passwd <USER>
```
