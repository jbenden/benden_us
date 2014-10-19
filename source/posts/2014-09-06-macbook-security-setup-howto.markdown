---
category: prose
layout: prose
series: Benden.us
title: "MacBook Security Setup HOW-TO"
date: 2014-09-06 13:47
comments: false
---

MacBook Security Setup HOW-TO
=============================

In this article I cover how to securely configure your brand new
MacBook laptop. It is assumed that the machine is new or has OS X
freshly installed. At the end of this document, your laptop will be as
secure as possible and follow the rules of [NSA](http://nsa.gov)
[security configuration guides](https://www.nsa.gov/ia/mitigation_guidance/security_configuration_guides/operating_systems.shtml).

User account set-up
-------------------

In order to mitigate against Trojan-horse viruses, we follow the two
account rule. The rule states that there is an administrative log-in
that is separate from a regular user account that is actually used for
day-to-day activities. Following this rule will prevent you from a
myriad of attack vectors.

We assume the first account created is the administrator account, as
this is the default behavior of OS X's installation procedure. If
needed, renamed this account to something other than your name.

Next, add a new log-in account from *System Preferences*->*User
& Groups*. Be **sure** to disable the *Allow User to Administer This Computer*
setting.

Securing the Network
--------------------

In order to prevent ourselves from network attacks we must enable the
firewall that comes standard with OS X. Navigate to *System
Preferences*->*Security & Privacy* and select the *Firewall* tab.
Next, click on the button to *Enable Firewall*.

Disabling the guest user account
--------------------------------

In order to ensure our network security, we'll also explicitly disable
the guest user account. To do this, navigate to *System
Preferences*->*User & Groups* and select the *Guest* user account.
Ensure that this account is disable from usage by un-checking the
*Allow users to login to this computer*.

If file sharing is necessary, you may enable the *Allow guest users to
connect to shared folders* option.

Now log-out of the administrative account.

Securing the hard-drive
-----------------------

Log-in as your user account and navigate to *System
Preferences*->*Security & Privacy*. Select the *FileVault* tab and
click the button to *enable FileVault*. You may need to click the lock
icon in the lower left-hand side of the window.

This enables home folder encryption using the AES-256 standard encryption
protocol. While not completely safe, some encryption is better than
none. In an ideal world, Apple would allow the bits of encryption used.

Email
-----

Understanding and using PGP encryption is critical. To make your life
easier on OS X, the [GPGMail](https://gpgtools.org) suite of software
exists. Download the latest version applicable for your operating
system. Once installed, launch the *GPG Keychain Access* tool and
either import your existing PGP key or create a new one of at least
4096 bits in key length.

**NOTE**: To assist others in sending you email, it is best to upload
  your public key to what is known as a key server. This is done by
  right-clicking your own key inside of *GPG Keychain Access* and
  selecting *Send public key to keyserver*. Other users may then
  retrieve your public key by querying the public key servers.

Screensaver
-----------

It is critical that the screensaver automatically start after 1 minute
of inactivity. It is also recommended that a "hot-corner" be utilized
to quickly enable the screensaver when walking away from your system.
To enable the screensaver after one minute of inactivity, run the
following command from *Terminal*.

    # defaults write com.apple.screensaver idleTime 1

Software
--------

Having a suite of standard security tools is essential. The best
accepted way of achieving this is by installing
[Homebrew](http://brew.sh/). Paste the following line in to *Terminal*
to install [Homebrew](http://brew.sh/):

    # ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"

After it completes, follow its instructions to run `brew doctor`.

Once complete, use the following line to install the base utilities
used by many security experts:

    # brew install nmap git lynx elinks clamav

Final Thoughts
--------------

While these instructions go a long way towards the ultimate security,
they are *not* the complete answer. It is up to you to decide on what
software you install, files you open, and ultimately what you do with
your computer. These instructions are a starting point only.
