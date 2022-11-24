---
layout: post
title: "Dealing with untrusted Matrix homeservers"
date: 2022-11-24
categories: blog
layout: post
---

# Dealing with untrusted homeservers

Matrix homeservers are currently very trusted, for that reason it is important to know what are the consequences of an evil homeserver administrator.

## **Data**

At this moment, homeserver admins can gather lots of information about their users, this includes the following:

- IP addresses

- User agents (name, operating systems and client type)

- Metadata logs (room state, membership status, who you talk to and when...)

This is a problem since the way that the matrix protocol functions, metadata is distributed to every homeserver that is present within a room (servers with at least a single user inside the room). It means that the more homeservers there are in a room, the less privacy there will be, there are workarounds like limiting the allowed homeservers to your own homeserver but if that particular homeserver goes down, the entire room would go down. 

That is why you usually want multiple homeservers inside a room, that way data is mirrored and distributed, if one or two servers go down, people will still be able to talk to each other.

Decentralized accounts for Matrix aim to make this easier to do, and make the protocol very resistant to homeserver failure by mirroring data across multiple "trusted" homeservers.

## **Power**

Your Homeserver administrator can also take over your account, "hack it", reset passwords, manage sessions. For a comprehensive list of what a homeserver admin can do, check the [Synapse Admin API documentation](https://matrix-org.github.io/synapse/latest/usage/administration/admin_api/index.html). 

Your HS administrator can also gain full Admin powers inside rooms which have administrators on the local homeserver. *(the moderation bot `mjolnir` even has an easy to use command to do this, so not only your HS Admin is a threat, **but also everyone present in the `mjolnir` room)**.*

Therefore, if you do not trust a homeserver and want to have Admin powers inside a room you can follow this instructions:

1. Make the room with an account on a single trusted homeserver

2. Invite your untrusted homeserver account into it

3. Assign the untrusted homeserver account power *99* or *90* if you desire

4. Change every room permission for the Admin to the power level you have selected **(except the ACL ban list permission).**

In this situation, if your HS Admin took over your account, they could only achieve the power level which you have selected, and if something were to go wrong, you could log in into your other account and demote it, even though your HS admin could do substantial damage like banning and kicking users, you will always have control over the room.

## Some extra tips

Other things you can do are selecting homeservers carefully, it is suggested to choose a big and large homeserver with Administrators which you don't know, this should make you a lesser target.
