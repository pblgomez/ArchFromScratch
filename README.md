# ArchFromScratch
My installation from scratch

1. Download Arch ISO and boot
1. Download Arch Linux Fast Installer (https://github.com/MatMoul/archfi)
    ```
    wget archfi.sf.net/archfi
    ```
    If SourceForge is down, use this instead:
    ```
    wget matmoul.github.io/archfi
    ```
1. Install Arch
    ```
    sh archfi
    ```
1. Reboot

As root:
```
pacman -S sudo git base-devel
useradd -G sys,network,scanner,power,rfkill,users,video,uucp,storage,optical,lp,audio,wheel -m <USER>
passwd <USER>
# Give sudoers permission
sed -i 's/# %w.*) ALL$/%wheel ALL=(ALL) ALL/g' /etc/sudoers
```

As user:
```
git clone https://github.com/pblgomez/ArchFromScratch.git
```
