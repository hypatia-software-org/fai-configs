#!/bin/bash
$ROOTCMD sed -i "s/#listen_addresses = 'localhost'/listen_addresses = '0.0.0.0'/g" /etc/postgresql/13/main/postgresql.conf
