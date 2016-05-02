#!/bin/bash

fcopy /etc/apache2/mods-enabled/auth_cas.conf
$ROOTCMD a2enmod auth_cas
