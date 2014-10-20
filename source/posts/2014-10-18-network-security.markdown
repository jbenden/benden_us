---
category: prose
layout: prose
series: Benden.us
title: "Network Security"
date: 2014-10-18 13:53
comments: false
---

Network Security
================

There is a plentiful amount of information about network security. So
much in fact that it is tremendously difficult to even start learning
about the practice. Even worse is the fact that the remote targets may
know more about the subject than you yourself. So how the hell are you
suppose to maintain a secure network?

In this article I will cover the most common types of networks that
are present in homes and small-to-medium businesses. Enterprise
networks may take information away from this article too.

Perimeter Security
------------------

All networks have a number of entrance and exits to the network. This
are the critical spot at which a number of techniques may be applied
to keep down the network vulnerabilities.

First off, disable any broadcast ICMP ping responses. This is often
overlooked and nearly impossible with most home networking equipment;
however, it does present a problem in that you can become a target of
an ICMP broadcast storm effect.

Second off, for inbound IP ACL rules, permit only your own IP address
space to enter the network. So the rule is permit all traffic going to
your IP address space. Additionally, block all traffic to the RFC1918
IP addresses and to 255.255.255.255.

Next off, for outbound IP ACL rules, permit only your own IP address
space to leave the network. So the rule is to permit all traffic
exiting your network within your IP address space.

These two rules are called ingress and egress filtering. They prevent
malicious attacks from entering the network on forged IP packets, be
it from your own network or any of the private network address space.
This stops many types of attacks and is simple and effective. It also
protects your exiting traffic such that you are not condoning the
forging of IP addresses.

Additionally, on all perimeter routers, disable Cisco Discovery
Protocol or any similar types of traffic. This leads to information
leakage that may help a remote suspect in identifying your equipment
and any known vulnerabilities it may have.

Wi-Fi Enabled Networks
----------------------

It should go without saying, but *only* use WPA2 encryption for
wireless networking. Anything else is only a stumbling block for an
average suspect and they will gain access to the network with a little
bit of time and a few tools.

For SMB or Enterprise networks, it is best to utilize 802.1X and
have a RADIUS server configured to answer requests from known MAC
addresses. Any other device is handed a bad IP address and logged for
the attempted access or at least placed onto a guest network where
access is very restricted. It is a good idea to monitor and graph the
traffic usage of the guest networks as they can be troublesome for
Internet connectivity usage.

The choice of wireless protocols to use is up to you.
Currently 802.11ac is the standard and most will be upgrading to it
soon.

Hosts on the network
--------------------

Just because you have implemented a secure network for your usage does
not mean that you can get away without running a local firewall on
each and every computer connected to the network. This is the last
defenses for most networks and is especially necessary for an
attacker whom is already on the local network. So it is important to
only permit traffic that is acceptable between machines and deny all
other traffic.

Permitting remote access to outsiders
-------------------------------------

The best way to provide outsiders access to the internal network is
via IPSec. Other protocols have been developed but are not always
supported on every system or machine. Ideally a Cisco ASA or Cisco PIX
is utilized for both VPN access and perimeter security. Other vendors
provide adequate hardware too.

Summary
-------

While this is a short article on network security, the most
troublesome spots were covered for most networks that exist. If this
information is applied correctly you will have a very secure network.

If you have any questions or comments about network security, please
email [Joseph Benden](mailto:joe@benden.us) to discuss and possibly
have an updated note placed on this article. I look forward to your
comments and suggestions!
