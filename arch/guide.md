# Installing Arch with i3wm
This guide will leave you with a fresh install of Arch Linux with the i3
[window manager](#link), along with basic knowledge on how to customize
your system for functionality and visibility.


# Index

  - [Installing Arch with i3wm](#installing-arch-with-i3wm)
  - [Index](#index)
  - [Installation](#installation)
    - [Creating a Live USB or CD](#creating-a-live-usb-or-cd)
    - [Booting from the Install Medium](#booting-from-the-install-medium)
      - [Network Connectivitiy](#network-connectivity)
      - [System Time](#system-time)
   - [Partitioning the Disk](#partitioning-the-disk)
  - [Useful Links](#useful-links)

# Installation

## Creating a Live USB or CD

## Booting from the Install Medium

### Network Connectivity
First thing to do after booting the live iso is to check that you have
internet. This can be done with a simple `ping 8.8.8.8`. 8.8.8.8 is a
Google DNS server, so it should always be online and shouldn't be
blocked by any routers or firewalls.

### Select Preferred Mirror
for pacman

> nano /etc/pacman.d/mirrorlist

If you have another computer, look up the list of mirrors.
Pick one geographically close to you (within your country should be good enough)
and copy that line in the file to the top. In `nano` this can be done with
<kbd>Alt</kbd>+<kbd>6</kbd> to copy line and <kbd>Alt</kbd>+<kbd>U</kbd> to paste.

Generally leaving the file as default will be fine, download speeds just may be a little slower than ideal.

### System Time
Next, update the system clock.

Create symbolic link of timezones.

> ln -s /etc/

Programs such as `ntp` can be used later, but on the live image run
`timedatectl set-ntp true` to make sure the system clock is accurate.

### Partitioning the Disk
Before installing Arch
Run `fdisk -l` to list all of your disks and

> Note: For GRUB to boot from a GPT-partitioned disk on a BIOS-based system, a BIOS boot partition is required.

Note: I got warnings during the pacstrap about possible missing firmware
for `aic94xx` and `wd719xx`.

#### Swap Partition
Swap space can be created either with a swapfile or swap partition.
I find it easiest to use a partition and haven't used a swapfile before.
I've had no problems using a swap partition.
I reccommend creating a swap partition roughly equal to the amount of RAM you have installed,
if you can spare the space.

### Install Base Arch System

> pacstrap -i /mnt base

#### genfstab

> genfstab -U /mnt >> /mnt/etc/fstab

I like to adjust the spacing in the generated file, but the default is perfectly fine.

### chroot

Run `arch-chroot /mnt` to 'boot' into the new arch install.
You are now inside the system as if you had booted into it, but are actually still on the live usb.

#### Locale

> nano /etc/locale.gen

Find your language and delete the `#` to uncomment the line.
For US users this is the line `en_US.UTF-8 UTF-8`.
Save and exit.

Run `locale-gen` to generate a locale file.

> echo LANG=en_US.UTF-8 > /etc/locale.conf

Or open the file and add the line. Adjust according to your locale.

### Move timezone info down to here

#### Hostname
Come up with a good name for your new system.

> echo yourhostname > /etc/hostname

Edit the /etc/hosts file (see wiki).

#### Network Config
Ensure that you have network connectivity, if not look up network configuration on the Arch wiki.

#### Users
Create a strong password for root.
Run `passwd` to set it.

To create a new user account (replace username with yours),

> useradd -m -g users -G wheel,storage,power -s /bin/bash username
> passwd username

#### Install more packages
Install `sudo` to make sure you can run things as root in your user account.

> pacman -S sudo

Next run `EDITOR=nano visudo` to edit the sudoers file.
Find the line `%wheel ALL=(ALL) ALL` and uncomment it.

#### Install bootloader

##### GRUB
TODO

### Exit
Exit the chroot environment with `exit` or `Ctrl+D`.
Unmount any partitions you mounted earlier with `umount -R /mnt` or similar.

`reboot` or `shutdown -r now`

# Useful Links

* Official guide on Arch wiki
* [Lifehacker - Build a Killer Customized Arch Linux Installation](https://lifehacker.com/5680453/build-a-killer-customized-arch-linux-installation-and-learn-all-about-linux-in-the-process)
* [Getting Started With Dotfiles](https://medium.com/@webprolific/getting-started-with-dotfiles-43c3602fd789)
* That video series on /r/unixporn
* /r/unixporn for lots of cool customizations
* Official i3 docs

