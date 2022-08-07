---
layout: default1
description: For QubesOS
title: Qubes Notes
permalink: /qubes
---

<div style="text-align:center;">
A collection of QubesOS-related information.
</div>
<br>

#### Table of contents:


-\>> [Template Setup](#template-setup) <br>
  - -\> *[Debian](#debian)* <br>
     - -\> *[Security](#debian-security)* <br>
  - -\> *[Fedora](#fedora)* <br>
  - -\> *[Upgrading Fedora](#upgrading-fedora)* <br>
<br>

### Template Setup

Small notes for template setup

<br>

#### Debian

Running in Dom0:

```
sudo qubes-dom0-update qubes-template-debian-11-minimal
```

Running inside the template:

```
sudo apt update
```

Installing packages

```
sudo apt install qubes-core-agent-passwordless-root qubes-core-agent-dom0-updates qubes-usb-proxy qubes-gpg-split qubes-core-agent-networking git apt-transport-tor curl -y
```

Configuring git proxy

```
git config --global http.proxy http://127.0.0.1:8002
```

<br>

#### Debian Security

Installing Kicksecure:

```
curl --proxy http://127.0.0.1:8082/ --tlsv1.3 --proto =https --max-time 180 --output ~/derivative.asc https://www.kicksecure.com/derivative.asc
```

```
sudo cp ~/derivative.asc /usr/share/keyrings/derivative.asc
```

```
echo "deb [signed-by=/usr/share/keyrings/derivative.asc] tor+http://deb.w5j6stm77zs6652pgsij4awcjeel3eco7kvipheu6mtr623eyyehj4yd.onion bullseye main contrib non-free" | sudo tee /etc/apt/sources.list.d/derivative.list
```

Installing LKRG

```
sudo apt install --no-install-recommends lkrg-dkms linux-headers-amd64

```

Enabling Hardened Malloc:

```
sudoedit /etc/ld.so.preload
```

and add:

```
/usr/lib/libhardened_malloc.so/libhardened_malloc.so
```

<br>

#### Fedora

Running in Dom0:

```
sudo qubes-dom0-update qubes-template-fedora-36-minimal
```

Running inside the template:

```
sudo dnf update
```

Installing packages

```
sudo dnf install qubes-core-agent-passwordless-root qubes-core-agent-dom0-updates qubes-usb-proxy qubes-gpg-split qubes-core-agent-networking git -y
```

Configuring git proxy

```
git config --global http.proxy http://127.0.0.1:8002
```

<br>

#### Upgrading Fedora

Running in Dom0:

```
qvm-clone fedora-35 fedora-36

truncate -s 5GB /var/tmp/template-upgrade-cache.img

qvm-run -a fedora-36 gnome-terminal

dev=$(sudo losetup -f --show /var/tmp/template-upgrade-cache.img)

qvm-block attach fedora-<new> dom0:${dev##*/}
```

Running inside Fedora-36:

```
sudo mkfs.ext4 /dev/xvdi

sudo mount /dev/xvdi /mnt/removable

sudo dnf clean all

sudo dnf --releasever=36--setopt=cachedir=/mnt/removable --best --allowerasing distro-sync

```

Running inside Dom0:

```
qvm-shutdown fedora-36

sudo losetup -d $dev

rm /var/tmp/template-upgrade-cache.img
```