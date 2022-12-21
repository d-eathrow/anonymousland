---
layout: default1
description: For Qubes OS
title: Qubes OS
permalink: /qubes
---

<div style="text-align:center;">
A collection of Qubes OS-related information.
</div>
<br>

Website: [https://qubes-os.org](https://qubes-os.org) <button type="button" class="btn btn-default btn-xs"><a href="http://qubesosfasa4zl44o4tws22di6kepyzfeqv3tg4e3ztknltfxqrymdad.onion/">Tor</a></button>

<br>

#### Table of contents:

-\>> [Best Practices](#best-practices) <br>
-\>> [Template Setup](#template-setup) <br>
  - -\> *[Debian](#debian)* <br>
     - -\> *[Security](#debian-security)* <br>
  - -\> *[Fedora](#fedora)* <br>
  - -\> *[Upgrading Fedora](#upgrading-fedora)* <br>
  - -\> *[Whonix](#whonix)* <br>

-\>> [Links & Resources](#links--resources) <br>
  - -\> *[Customizations](#customizations)* <br>
  - -\> *[Guides](#guides)* <br>
  - -\> *[Templates](#templates)* <br>
  - -\> *[Wiki](#wiki)* <br>

<br>

### Best Practices

- All repositories should be routed over Tor and [onionized](https://anonymousland.org/#onionizing-repositories)

- Each application should be installed in its own separate minimal template Qube (provided your system has applicable resources for such)

- `sys-usb` should be configured on a laptop

- Avoid using `sleep` on a Qubes system

- Read all of the Qubes documentation

- Frequently visit the Qubes forums

- Consider creating a shutdown script / shortcut

- Consider if you would benefit by creating backups of your Qubes system

- Update frequently

- Harden Qubes if applicable (Debian kicksecure, Fedora CORP hardened-malloc, etc.)


<br>

### Template Setup

Small notes for template setup

<br>

#### Debian

Running in Dom0:

```
sudo qubes-dom0-update qubes-template-debian-11-minimal
```

```
qvm-run --pass-io -u root template-debian-11-minimal 'apt instal qubes-core-agent-passwordless-root'
```

Running inside the template:

```
sudo apt update
```

Installing packages

```
sudo apt install qubes-core-agent-dom0-updates qubes-usb-proxy qubes-gpg-split qubes-core-agent-networking git apt-transport-tor curl
```

Configuring git proxy

```
git config --global http.proxy http://127.0.0.1:8082/
```

<br>

#### Debian Security


```
sudo apt-get install grub2 qubes-kernel-vm-support
```

```
sudo apt-get -t bullseye-backports --no-install-recommends install linux-image-amd64 linux-headers-amd64
```

```
sudo grub-install /dev/xvda
```

Adding the Kicksecure repository:

```
curl --proxy http://127.0.0.1:8082/ --tlsv1.3 --proto =https --max-time 180 --output ~/derivative.asc https://www.kicksecure.com/derivative.asc
```

```
sudo cp ~/derivative.asc /usr/share/keyrings/derivative.asc
```

```
echo "deb [signed-by=/usr/share/keyrings/derivative.asc] tor+http://deb.w5j6stm77zs6652pgsij4awcjeel3eco7kvipheu6mtr623eyyehj4yd.onion bullseye main contrib non-free" | sudo tee /etc/apt/sources.list.d/derivative.list
```
Installing Kicksecure package:

``kicksecure-qubes-cli`` and ``kicksecure-qubes-gui`` are available.

```
sudo apt install --no-install-recommends kicksecure-qubes-cli
```

Installing LKRG:

```
sudo apt install --no-install-recommends lkrg-dkms

```

Enabling Hardened Malloc:

```
echo "/usr/lib/libhardened_malloc.so/libhardened_malloc.so" | sudo tee /etc/ld.so.preload
```

<br>

#### Fedora

Running in Dom0:

```
sudo qubes-dom0-update qubes-template-fedora-36-minimal
```

```
qvm-run --pass-io -u root template-fedora-36-minimal 'apt instal qubes-core-agent-passwordless-root'
```

Running inside the template:

```
sudo dnf update
```

Installing packages

```
sudo dnf install qubes-core-agent-passwordless-root qubes-core-agent-dom0-updates qubes-usb-proxy qubes-gpg-split qubes-core-agent-networking git
```

Configuring git proxy

```
git config --global http.proxy http://127.0.0.1:8082/
```

<br>

#### Upgrading Fedora

Running in Dom0:

```
qvm-clone fedora-35 fedora-36
```

```
truncate -s 5GB /var/tmp/template-upgrade-cache.img
```

```
qvm-run -a fedora-36 gnome-terminal
```

```
dev=$(sudo losetup -f --show /var/tmp/template-upgrade-cache.img)
```

```
qvm-block attach fedora-36 dom0:${dev##*/}
```

Running inside Fedora-36:

```
sudo mkfs.ext4 /dev/xvdi
```

```
sudo mount /dev/xvdi /mnt/removable
```

```
sudo dnf clean all
```

```
sudo dnf --releasever=36--setopt=cachedir=/mnt/removable --best --allowerasing distro-sync
```

Running inside Dom0:

```
qvm-shutdown fedora-36
```
```
sudo losetup -d $dev
```

```
rm /var/tmp/template-upgrade-cache.img
```

<br>

#### Whonix

Whonix-GW and Whonix-WS should be upgraded via:

```
upgrade-nonroot
```

Installing LKRG:

```
sudo apt install --no-install-recommends lkrg-dkms
```

Enabling Hardened Malloc:

```
echo "/usr/lib/libhardened_malloc.so/libhardened_malloc.so" | sudo tee /etc/ld.so.preload
```

<br>

### Links & Resources

- [qpowerkill](https://github.com/NobodySpecial256/qpowerkill)

- [Qubes for security auditing](https://forum.qubes-os.org/t/qubes-for-organizational-security-auditing-talk-notes/199)

- [Qubes-lite with KVM and Wayland](https://roscidus.com/blog/blog/2021/03/07/qubes-lite-with-kvm-and-wayland/)

<br>

#### Customizations

- [Wallpapers](https://forum.qubes-os.org/t/qubes-os-wallpapers/2819)

- [KDE](https://forum.qubes-os.org/t/kde-changing-the-way-you-use-qubes/4730)

- [XFCE Global Dark Mode](https://forum.qubes-os.org/t/guide-xfce-global-dark-mode-in-qubes-4-0-4-1/10757)

<br>

#### Guides

- [Advanced Browser Fingerprinting](https://forum.qubes-os.org/t/advanced-browser-fingerprinting/12379)

- [Monero Wallet Isolation](https://forum.qubes-os.org/t/monero-wallet-daemon-isolation-with-qubes-whonix/1121)

- [Fom’s giant list of Qubes OS workarounds, tweaks and shenanigans](https://forum.qubes-os.org/t/fom-s-giant-list-of-qubes-os-workarounds-tweaks-and-shenanigans/15162)

- [Fully ephemeral dispvms](https://forum.qubes-os.org/t/fully-ephemeral-dispvms/12030)

- [Opening all files in disposable qube](https://forum.qubes-os.org/t/opening-all-files-in-disposable-qube/4674)

- [Kicksecure Guide](https://forum.qubes-os.org/t/guide-kicksecure-for-disp-sys/13324)

- [Qubes OS installation encrypted boot and header](https://forum.qubes-os.org/t/qubes-os-installation-detached-encrypted-boot-and-header/6205)

- [Trezor Bridge in 4.1](https://forum.qubes-os.org/t/how-to-set-up-the-trezor-bridge-in-4-1/11103)

- [split-ProtonMail](https://forum.qubes-os.org/t/guide-split-protonmail-offline-send-receive-qubes-pm-bridge-vm/11096)

- [How to create an Android Qube](https://forum.qubes-os.org/t/how-to-create-an-android-qube/8467)

<br>

#### Templates

- [Windows](https://github.com/elliotkillick/qvm-create-windows-qube)

- [Minimal](https://www.qubes-os.org/doc/templates/minimal/)

<br>

#### Wiki

- [Hardened-Kernel](https://www.kicksecure.com/wiki/Hardened-kernel) <button type="button" class="btn btn-default btn-xs"><a href="http://www.w5j6stm77zs6652pgsij4awcjeel3eco7kvipheu6mtr623eyyehj4yd.onion/wiki/Hardened-kernel">Tor</a></button>

- [VM Fingerprinting](https://www.whonix.org/wiki/VM_Fingerprinting) <button type="button" class="btn btn-default btn-xs"><a href="http://www.w5j6stm77zs6652pgsij4awcjeel3eco7kvipheu6mtr623eyyehj4yd.onion/wiki/VM_Fingerprinting">Tor</a></button>