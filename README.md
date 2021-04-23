Role Name
=========

This role automates the process of installing the neccesary Cache client Python libraries to allow connection to a Cahce database via Python.

Requirements
------------

It is assumed that Cache is to be installed somewhere on the network to allow testing.

Role Variables
--------------

host - The address of the Intersystems Cache server

[ Default - localhost ]

prt - The port on the Cache server to connect to

[ Default - 1972 ]


Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

    - hosts: servers
      role: cache-python
      host: cacheserver 
      ...

NOTE
----

This role is designed to be run with both 32 and 64 bit versions of Python but the tar file files/cache-python.tar only contains a 32 bit version of Pythonbind.so and so there is an exit in the playbook when a 64 bit architecture is detected.

License
-------

BSD

Author Information
------------------

Raman Sailopal
