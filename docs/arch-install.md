# Installing Arch Linux on laptop and how to make it usable
Forked from [hnykda/tutos](https://github.com/hnykda/tutos)

In this tutorial I'd like to cover all steps from installing Arch Linux
OS to stable, secure, and working system with working Wi-Fi, windows
manager (i3) etc.

All my current configs are in this repository. Feel free to inspire from
them (as I did from others).

## Installation

There are tons of step-by-step guides how to install Arch so I will not
go to deep here. Just look to
[nstallation guide &lt;https://wiki.archlinux.org/index.php/installation\_guide].
Anyway, short summary:

### Primary installation

#### Partitioning

You have to prepare disc(s) where you'll install Arch Linux. One disc
can be separated to more partitions. I recommend you to use two
partitions for Arch Linux. One for system and second for user data
(alias "home directory"). You can of course have one or more - as you
wish. In this tutorial I will use 2 partition. It doesn't matter if
there are next partitions with other systems (next Linux, Windows...).
How big partitions should be? I recommend you 40GB-50GB for system and
rest for home. The easiest way to partition is to use GParted. If you
are using Linux, you can download from your distribution and make it
from there. Of course, you'll not be able to resize, create etc.
partitions on disc which is currently used. In that case, or if you
don't have Linux, there is GParted life distribution - make a booting
USB flash with that. In GParted you have to create two partitions with
previously stated sizes and format them to file system "ext4". Piece of
cake. For convenience it's fine to label them also (when you create
partition, you can add label).

There might be problem with your BIOS - it don't have to has booting
from USB flash as default. You need to change an order of priority in
your BIOS (the "thing" before operating systems boots up). Google is
your friend :) .

#### Installing Arch Linux

Now you have prepared disc for installation. Download last ISO of Arch
Linux and make a booting USB flash with that. When you'll be done with
that, insert USB flash to PC and run it. It should boot up to Arch Linux
prompt (terminal, console). Now we need to connect to the internet. You
can use command `Wi-Fi-menu` or just plug in ethernet cable. To check if
you are connect, try `ping google.com`. If you get response, it's
working. Now we need to join prepared partitions to currently running
OS. Which are they? You can find it out by typing `lsblk`. There will be
listed all partitions. You care about the two you partitioned earlier.
You should recognize them thanks to the size. If you are not sure,
you'll find it out in a minute. In my case, there is /dev/sda5 for
system (40GB) and /dev/sda6 for home. Of course it might differ from
yours, so substitute it to your case. Do \* `mount /dev/sda5 /mnt` \*
check if it is empty `ls /mnt`. If you don't see anything

  [nstallation guide &lt;https://wiki.archlinux.org/index.php/installation\_guide]:
    nstallation%20guide%20%3Chttps://wiki.archlinux.org/index.php/installation_guide
