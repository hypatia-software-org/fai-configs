#!/bin/bash

fcopy -Bv /etc/init.d/install-mediagoblin
$ROOTCMD update-rc.d install-mediagoblin defaults
sed 's_GMG_PATH_TOKEN_'$GMG_PATH'_g' -i $target/etc/init.d/install-mediagoblin
