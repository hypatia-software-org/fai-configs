#!/bin/bash

# Copy configs
fcopy -Bv /etc/init.d/install-mediagoblin
fcopy -Bv /etc/init.d/mediagoblin-paster
fcopy -Bv /etc/init.d/mediagoblin-celery-worker
fcopy -Bv /etc/mediagoblin-templates/mediagoblin.ini
fcopy -Bv /etc/nginx/sites-available/mediagoblin
fcopy -Bv /etc/nginx/mediagoblin-common.conf

# Add installer to boot
$ROOTCMD update-rc.d install-mediagoblin defaults
fqdn=$HOSTNAME.$DOMAIN

# Replace Tokens
sed 's^GMG_PATH_TOKEN^'$GMG_PATH'^g' -i $target/etc/init.d/install-mediagoblin
sed 's^GMG_PATH_TOKEN^'$GMG_PATH'^g' -i $target/etc/init.d/mediagoblin-celery-worker
sed 's^GMG_PATH_TOKEN^'$GMG_PATH'^g' -i $target/etc/init.d/mediagoblin-paster

sed 's^GMG_PATH_TOKEN^'$GMG_PATH'^g' -i $target/etc/mediagoblin-templates/mediagolbin.ini
sed 's^GMG_SENDER_TOKEN^'$GMG_SENDER'^g' -i $target/etc/mediagoblin-templates/mediagolbin.ini

sed 's^GMG_PATH_TOKEN^'$GMG_PATH'^g' -i $target/etc/nginx/mediagoblin-common.conf

sed 's^GMG_FQDN_TOKEN^'$fqdn'^g' -i $target/etc/nginx/sites-available/mediagoblin

# enable nginx config
$ROOTCMD ln -s /etc/nginx/sites-available/mediagoblin /etc/nginx/sites-enabled/mediagoblin
