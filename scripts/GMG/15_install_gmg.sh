#!/bin/bash

fcopy -Bv /etc/init.d/install-mediagoblin
fcopy -Bv /etc/init.d/mediagoblin-paster
fcopy -Bv /etc/init.d/mediagoblin-celery-worker

$ROOTCMD update-rc.d install-mediagoblin defaults
sed 's^GMG_PATH_TOKEN^'$GMG_PATH'^g' -i $target/etc/init.d/install-mediagoblin
sed 's^GMG_PATH_TOKEN^'$GMG_PATH'^g' -i $target/etc/init.d/mediagoblin-celery-worker
sed 's^GMG_PATH_TOKEN^'$GMG_PATH'^g' -i $target/etc/init.d/mediagoblin-paster
