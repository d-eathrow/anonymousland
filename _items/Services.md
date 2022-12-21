---
layout: default1
description: List of services
title: Services
permalink: /services
---

<div style="text-align:center;">
<i>“There are too many of us, he thought. There are billions of us and that's too many. Nobody knows anyone. Strangers come and violate you. Strangers come and cut your heart out. Strangers come and take your blood. Good God, who were those men? I never saw them before in my life!” </i>
</div>

## __Services__

These services are publicly available and free to use. 

Services are hosted in __Sweden__ and / or __Iceland__.

The hosting providers [1984](https://1984.is) and [Njalla](https://njal.la) are in use.

You can check the status of our Matrix Homeserver and all of our other services on our [status page](https://status.anonymousland.org/status/services).

<br>

## __Terms of Service (ToS)__

These services are not intended to spread spam or malicious content, or sharing / distributing / hosting of malicious content.

Your account *can* be suspended if you take part in any sort of malicious activity or questionable content including but not limited to targeted harassment, raids, phishing, DOXxing or violating laws of __Sweden__ and / or __Iceland__.

<br>

## __Privacy & Security policy__

<br>

### Matrix

- Registration is open, if abuse takes place, registration will turn to an invite-only system.

- Guest access is currently enabled, and will be disabled if abuse takes place.

- Moderation is done via ``mjolnir``, let us keep this ban list to a minimum.

- Ratelimiting actions is currently set as default on Matrix, and can be easily re-enabled if needed, do not ruin this for others.

- Metrics are disabled.

- Federation is enabled.

- URL previews are allowed.

- Synapse is hosted with [1984](https://1984.hosting/GDPR/)

- `user_ips_max_age` is set to `0s` (disabled)

- `bcrypt_rounds` is set to `16`

- `MSC2285` is enabled

The following nginx headers are set:

```
proxy_set_header X-Forwarded-For 0.0.0.0;
proxy_set_header X-Real-IP 0.0.0.0;
proxy_set_header X-Forwarded-Host 0.0.0.0;
```

<br>

## __Policies__

Your data and information will **NEVER** be sold or shared to another party. 

Matrix federation may cause some information to be sent to third party servers as this is how federation functions.

Your data and information will **NEVER** be handed away to *anyone*.

We try to collect as little information as possible, to protect *everyone*.

Additional services are hosted with [Njalla](https://njal.la/about/).

<br>

### __Matrix__

The Matrix homeserver is located at

`https://matrix.anonymousland.org`

Registration is done via the [registration page](https://matrix.anonymousland.org/register)

Incidents: `1`

###  __Clients__

- [Cinny](https://cinny.anonymousland.org) <button type="button" class="btn btn-default btn-xs"><a href="http://eoeh5ggqrjh7xlvcnydznsi4l53bvtue5rejs5relab3sdcsgrdvbiqd.onion/">Tor</a></button>
- [Element](https://element.anonymousland.org) <button type="button" class="btn btn-default btn-xs"><a href="http://ghs2cajvtd3zereksquw6gxgjyiuczwduri6bunvz5budvxpgr6mvwyd.onion/">Tor</a></button>

- [Schild](https://schild.anonymousland.org)


<br>

  <div class="panel panel-info">
      <div class="panel-heading">
        <h3 class="panel-title">Metadata</h3>
      </div>
      <div class="panel-body">
        Due to how the Matrix protocol functions, metadata including your Profile picture, username, display name and device list will be sent to other homeservers if you are in a federated room.
      </div>
    </div>

<br>

### __Matrix Onion Service__

We currently host a *beta* onion service available at:

`http://7pdtdadfcjvntnbip764d5sc35d2s7hhdkbbie5hy7njovea4534vxqd.onion/`

Corresponding onion Element instance:

`http://ps3364wgpvq46iumfm7wcewr3qxymtnd2fo753gvngzbumir7wyrlvad.onion/`

<br>

### __Mastodon__

Mastodon instance is located at:

`https://mastodon.anonymousland.org`

and requires an email address for sign-up.

<br>

### __Git__

Gitea instance is located at:

`http://git.anonymousland.org`

and requires an email address for sign-up.

<br>

## __Additional Services__

- [Dimension](https://dimension.anonymousland.org)
- [OTS](https://ots.anonymousland.org)
- [Paste](https://paste.anonymousland.org)