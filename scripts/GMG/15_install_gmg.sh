#!/bin/bash

fcopy -Bv /etc/init.d/install-mediagoblin
$ROOTCMD update-rc.d install-mediagoblin defaults
sed 's^GMG_PATH_TOKEN^'$GMG_PATH'^g' -i $target/etc/init.d/install-mediagoblin
