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
useradd -G sys,network,scanner,power,rfkill,users,video,uucp,storage,optical,lp,audio,wheel -m <USER>
passwd <USER>
```
