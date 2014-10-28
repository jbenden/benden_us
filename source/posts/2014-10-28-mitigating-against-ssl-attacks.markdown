---
category: prose
layout: prose
series: Benden.us
title: "Mitigating Against SSL Attacks"
date: 2014-10-28 11:57
comments: false
---

Mitigating Against SSL Attacks
==============================

With most of the browser population using a modern browser, you must
consider removing support of SSL version 2 and 3. Only TLS connections
must be accepted. This protects against a number of attacks, including
the latest POODLE attack.

Additionally, the list of acceptable ciphers should be specified
according to current best practices.

A line such as the following (for Apache) will suffice in protecting
your servers:

    SSLCipherSuite !aNULL:!eNULL:!EXPORT:!DSS:!DES:!DHE-RSA-AES256-SHA:!AES256-SHA:!DHE-RSA-AES128-SHA:!EDH-RSA-DES-CBC3-SHA:!DES-CBC3-SHA:!DHE-RSA-AES128-SHA:!DES-CBC3-SHA:!AES128-SHA:RC4-SHA:RC4-MD5:ALL

With those ciphers selected and only TLSv1 connections being accepted,
you shouldn't have too many problems.

To mitigate against cipher renegotiation, you'll have to use an SSL
accelerator system. Otherwise you are susceptible to attacks based on
constantly renegotiating the cipher used. More about this subject is
available at [THC.org](http://thehackerschoice.wordpress.com/2011/10/24/thc-ssl-dos/).

Summary
-------

A few steps can protect you tremendously, but only a hardware based
solution will ultimately protect you against the various forms of
attack. But for the most of us, the simple rules of disabling version
2 and version 3 of SSL in combination with an acceptable cipher list
will go a long way.
