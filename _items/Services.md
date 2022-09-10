---
layout: default1
description: List of services
title: Services
permalink: /services
---

### __Services__

These services are publicly available and free to use. 
These services are not intended to spread spam or malicious content, or sharing / distributing / hosting of malicious content.

<br>

*Everything done on these services **MUST** remain legal.*

<br>

Your account *can* be suspended if you take part in any sort of malicious activity ranging from targeted harassment, raids, discussing illegal activities, conducting illegal activities or any questionable content.

<br>

### __Privacy / Security__

As nature of this website, privacy and security must be our main priority, the following is currently in effect:

- nginx logging is disabled.

- Matrix IP addresses are logged for 30 seconds then they are purged from the database.

- Matrix federation is enabled.

- Ratelimiting actions is currently set as default on Matrix, and can be easily re-enabled if needed, do not ruin this for others.

- Matrix URL previews are allowed

- We are currently not using a CAPTCHA for registration or requiring an Email, CAPTCHA will be enabled if abuse happens!

- Registration is open, if abuse takes place, registration will turn to an invite-only system.

- Password hashing bcrypt rounds are set to 15.

- Guest access is currently enabled, and will be disabled if abuse takes place.

- Registered users are automatically joined into the lounges, this is to help prevent abuse!

- Moderation is done via ``mjolnir``, let us keep this ban list to a minimum.

- Matrix metrics are disabled.

<br>

### __Policies__

Your data and information will **NEVER** be sold or shared to another party. 
Matrix federation may cause some information to be sent to third party servers as this is how federation functions.

Your data and information will **NEVER** be handed away to *anyone*.

We try to collect as little information as possible, to protect *everyone*.

#### __Matrix__

The Matrix homeserver is located at

`https://matrix.anonymousland.org`

`[element.anonymousland.org](https://element.anonymousland.org)` - Self-hosted Element instance

You can check the status of the homeserver on our [status page](https://status.anonymousland.org/status/services).

Incidents: ``1``

Password Policy:

- 15 characters

- Require at least 1 digit

- Require at least 1 symbol

- At least 1 lowercase character

- At least 1 uppercase character

Due to how the Matrix protocol functions, metadata including your Profile picture, username, display name and device list will be sent to other homeservers if you are in a federated room.
An IP address is automatically assigned with each client, signing out will remove your IP from the client and from the database as well.
