41;297;0c#!/bin/bash

fcopy /etc/munin/munin.conf
if [ ! -f $target/etc/apache2/sites-available/$SERVERNAME.conf ]; then
echo <<EOF > $target/etc/apache2/sites-available/$SERVERNAME.conf
<VirtualHost *:80>
        ServerAdmin sysadmin@ftee.org
        ServerName      $SERVERNAME
        DocumentRoot /var/cache/munin/www
        <Directory />
                Options FollowSymLinks
                AllowOverride None
        </Directory>
        LogLevel notice
        CustomLog /var/log/apache2/access.log combined
        ErrorLog /var/log/apache2/error.log
        ServerSignature On
</VirtualHost>
EOF

$ROOTCMD a2ensite $SERVERNAME
fi
