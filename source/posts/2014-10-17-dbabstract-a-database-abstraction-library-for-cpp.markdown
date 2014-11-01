---
category: prose
layout: prose
series: Benden.us
title: "DBAbstract: A Database Abstraction Library for C++"
date: 2014-10-17 08:27
comments: false
---

DBAbstract: A Database Abstraction Library for C++
==================================================

The *dbabstract* library is written in standard C++ and uses the [POCO
library](http://pocoproject.org) for its [Poco::SharedLibrary](http://pocoproject.org/docs/Poco.SharedLibrary.html) implementation. It is known that
the [POCO library](http://pocoproject.org) includes a basic database wrapper implementation, but
it is not as clean and simple as *dbabstract*. It also suffers some
missing functionality that *dbabstract* provides.

*Dbabstract* currently supports the following databases:

* MySQL
* PostgreSQL
* Sqlite3

Installation
------------

[Download the latest release](https://github.com/jbenden/dbabstract) and simply perform the normal autotools
steps:

    # LIBPATH="/usr/lib" ./configure --prefix=/usr --with-mysql=/usr/lib --with-sqlite=/usr/lib --enable-doc
    # make
    # make install

Usage
-----

The usage of *dbabstract* is simple. First the appropriate database
abstraction must be loaded. This is achieved by building a path to the
appropriate shared library.

    std::string path(LIBPATH "/libdba_mysql");
    path.append(Poco::SharedLibrary::suffix());
    Poco::AutoPtr <Connection> connection (Connection::factory(path.c_str()));

After the library is loaded, then calls may be issued to connect to a
database and perform a query:

    if (connection->open("test", "127.0.0.1", 3306, "root", "")) {
        std::cout << "OK: Connected to database." << std::endl;
        ResultSet *rs3 = connection->executeQuery("SELECT id, data FROM testing");
        if (rs3) {
            while (rs3->next()) {
                std::cout << "READ: id=" << rs3->getInteger(0) << " data=" << rs3->getString(1) << std::endl;
            }
        rs3->close();
    }

Final Thoughts
--------------

While this database abstraction library is both simple and elegant, it
could use a few more database adapters. If you want to contribute to
the project, then simply send a pull request through GitHub. I would
be happy to accept contributions from the community.

The [source is available here](https://github.com/jbenden/dbabstract).

Cmake Version
-------------
A Cmake compatible version is available [here](https://github.com/jbenden/dbabstract/tree/cmake). This will eventually be the supported version of *dbabstract*.

