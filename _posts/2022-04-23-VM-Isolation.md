---
layout: post
title: "VM Isolation Guide"
date: 2022-04-23
categories: blog
layout: post
---

VM Isolation Guide
------------------

Credits: 0xTheFather

As an alternate to using Qubes OS, here is how one can properly setup isolation. This setup will provide proper isolation utilizing VMs and a secure host OS. This will provide increased security via isolation along with increased privacy with compartmentalization.

Things needed for this setup:

*   Large external SSD (preferably thunderbolt)
*   Enough RAM for your VMs
*   VPN(s) (based upon your threat model)

### Step 1: Choose the host OS

Choosing the host OS is by far the most critical part of this setup. This host OS will need to have proper security updates and have the ability for increased hardening. Here are a few that would be recommended.

*   [Fedora](https://getfedora.org/)
*   [Void Linux](https://voidlinux.org/) (hardened musl build is highly recommended)
*   [Arch](https://archlinux.org/)
*   [PlagueOS](https://git.arrr.cloud/whichdoc/plagueos) (Hardened by default which makes it perfect for this setup)

### Step 2: Install the OS

After choosing your host OS, ensure to download, verify, and then boot to your live OS. During the installation process, make sure you encrypt everything including `/boot` using LUKS. Set a strong root/admin password then create a guest account that we'll be using. Make sure to install the OS on your internal drive, we are saving the external SSD for later.

Note: If you've chosen PlagueOS, many of these things will automatically be applied for you due to the nature of the OS.

### Step 3: Host OS hardening

After the host OS has been installed, it's now time to harden it. Depending on your distro, there will be slightly different techniques on hardening. General hardening ideas that apply to all distros are listed here:

*   UFW / IPTables
*   Fail2Ban
*   Disable / tighten default SSH
*   Kernel hardening
*   Sandboxing
*   User & Root

and of course there are plenty of guides on how to do this as well

*   [Madaidans-Insecurities](https://madaidans-insecurities.github.io/guides/linux-hardening.html)
*   [The Practical Linux Hardening Guide](https://github.com/trimstray/the-practical-linux-hardening-guide)
*   [Awesome Security Hardening](https://github.com/decalage2/awesome-security-hardening)

along with using tools such as [lynis](https://cisofy.com/lynis/) for security auditing.

### Step 4: Setting up the external SSD

We are going to be storing all of our VMs on the external SSD, with this being said- we must now encrypt the entire SSD. Use a very strong password and the strongest encryption for this as this is where all of our files will be stored. There are multiple different ways to encrypt this SSD such as LUKS or Veracrypt, use whatever is best suited for yourself. Veracrypt can create hidden containers which you can utilize. Ensure you use full disk encryption.

### Step 5: Setting up VMs

After you've successfully hardened your distro, you are now ready to prepare your VMs. All of your activities will happen in your VMs rather than in your host. This provides excellent security along with compartmentalization. **Nothing at all will happen on your host.** Make sure you've setup QEMU/KVM for your proper distribution and we can get ready.

We are now going to be using the external SSD that we setup previously. Now based upon what kind of setup you are going for, this process may be different. You could potentially setup template VMs and harden those and simply clone them based upon your activities.

Example - You setup a fedora-based VM which you've somewhat hardened. You can now clone this VM for your work and school use without having to setup fedora twice.

You can know combine this VM technique with your other activities such as personal browsing, work, school, messing around, matrix, telegram, etc, and separate each one into its own VM without having to worry about malware, tracking / "cross contamination" etc.

![](https://i.imgur.com/HD3FIK4.png)

The benefit of doing this over Qubes is compatibility. Qubes runs on very specific hardware which locks it down to a select group of people. Another benefit this provides, is that because all of our VMs are on an external SSD, this provides you with the option of simply just moving PCs easily, wiping your host OS for several reasons including paranoia, suspect of malware / unwanted program, or just general housekeeping. Your able to just wipe your entire host OS as much time as you want if you fear you misconfigured something or you feel something isn't right.

### Step 6: More thoughts

The possibilities with this system are endless. You do what you want based upon your threat model. Here are some general thoughts that are just going to be put here

*   If on a laptop, you can tape your SSD to the back of the screen as a storage mechanism
*   Have another SSD as a backup for your VMs
*   Setup a script to automatically harden your system
*   Utilize VPNs to better compartmentalize your system
*   Using [PlagueOS](https://git.arrr.cloud/whichdoc/plagueos) as the host OS can provide many benefits because of the highly-hardened system, almost no additional hardening would be required and setup is easy.

In the end, it is all up to the user based upon their needs.
