---
category: prose
layout: prose
series: Benden.us
title: "Server Security HOW-TO"
date: 2014-09-18 09:33
comments: false
---

Server Security HOW-TO
======================

In this article I cover how to securely configure your general purpose
web server running on Linux, FreeBSD, Solaris, OS X, or any UNIX-clone
operating system. While the topics presented do not all apply to a
Windows environment, many of the techniques are still applicable to a
Windows server environment.

This article focuses on network security predominately. This article
does not cover physical security or local console access security.

In addition to this article, the documentation available at [NSA](http://nsa.gov)
[security configuration guides](https://www.nsa.gov/ia/mitigation_guidance/security_configuration_guides/operating_systems.shtml)
provides additional information relating to each of the operating systems.

OS Installation
---------------

When installing the operating system, be certain to properly dedicate
separate partitions to /tmp, /var/tmp, and other partitions to
adequately protect the system.

Partitions
----------

For all UNIX-like systems, the `/tmp` folder should be mounted as
`noexec,nosuid,nodev`. Simply enforcing this will eliminate a many of
threats via HTTP by denying the ability to execute a shell script from
the temporary partition.

NOTE: Some operating systems are known to partially function with a
properly mounted `/tmp` partition. For these operating systems, simple
modifications to certain files will enable the `/tmp` partition to be
mounted appropriately.

SSH
---

To ensure the highest level of protection, only enable version 2 of
the protocol. Additionally, use RSA keys (of at least 4096 bits) for
root access and set `PermitRootLogin` to be set to `without-password`.
Be certain that no DSA keys are in use.

Next, use a tool such as [DenyHosts](http://denyhosts.sourceforge.net)
or [Fail2Ban](http://www.fail2ban.org/) to mitigate against
dictionary attacks or brute-force cracking attempts.

IP Addressing
-------------

It is best practice to use two IP addresses per machine, minimum. The
primary IP address assigned is used for all services available on the
machine, while the second IP address is assigned to SSH access and
nothing else. With this configuration, crackers can try their best to
crack the publicly facing IP address (which would be best to be
firewalled) all they want. A firewall rule should exist to permit
acceptable IP address ranges access to the SSH port on the secondary
IP address.

Firewall
--------

Ensure that the host firewall is enabled with a default policy of
DENY. Only permit the traffic that is known to be acceptable to this
machine, nothing else. This helps to ensure that rouge programs
running are not able to serve random ports. Additionally, only
acceptable ICMP requests should be accepted.

Refer to any number of firewall best practices guides or books on the
subject to learn how to configure your firewall available to you.

User account set-up
-------------------

Ensure that user accounts created are assigned the `/bin/false` shell,
unless they are permitted SSH access. If they are permitted SSH
access, then consider using one of many restricted shells to only
allow SFTP for instance.

Be sure to create each user as a unique ID number and a unique group
ID number. This helps to secure each user from one another. Use shared
groups where appropriately needed.

Final Thoughts
--------------

While this document does not cover the exact steps to follow, it does
cover the general concepts necessary for a secured server to exist on
the Internet. Following these guidelines are highly recommended.
Please be certain to read any and all information you can on securing
a server as having an unsecured computer does no one any good;
however, it offers bad people an opportunity to misuse your server
for their own purposes.
