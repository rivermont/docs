# Installing Arch with i3wm
This guide will leave you with a fresh install of Arch Linux with the i3
[window manager](#link), along with basic knowledge on how to customize
your system for functionality and visibility.


# Index

  - [Installing Arch with i3wm](#installing-arch-with-i3wm)
  - [Index](#index)
  - [Useful Links](#useful-links)
  - [Installation](#installation)
    - [Creating a Live USB or CD](#creating-a-live-usb-or-cd)
    - [Booting from the Install Medium](#booting-from-the-install-medium)

# Installation

## Creating a Live USB or CD

## Booting from the Install Medium

### Network Connectivity
First thing to do after booting the live iso is to check that you have internet.
This can be done with a simple `ping 8.8.8.8`. 8.8.8.8 is a Google DNS server,
so it should always be online and shouldn't be blocked by any routers or firewalls.

### System Time
Next, update the system clock.
Programs such as `ntp` can be used later, but on the live image run `timedatectl set-ntp true`
to make sure the system clock is accurate.

## Partitioning the Disk

> Note: For GRUB to boot from a GPT-partitioned disk on a BIOS-based system, a BIOS boot partition is required.

Note
I got warnings during the pacstrap about possible missing firmware for `aic94xx` and wd719xx`.

# Useful Links

* Official guide on Arch wiki
* [Getting Started With Dotfiles](https://medium.com/@webprolific/getting-started-with-dotfiles-43c3602fd789)
* That video series on /r/unixporn
* /r/unixporn for lots of cool customizations
* Official i3 docs
