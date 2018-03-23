#!/bin/sh

base=/var/www
user=www-data
hostname=wp.hypatiasoftware.org
instance_url=https://$hostname

$ROOTCMD mkdir -p $base
curl -L https://wordpress.org/latest.tar.gz | zcat - | $ROOTCMD tar xf - -C$base/
$ROOTCMD ls -l $base
$ROOTCMD sh -c "mv $base/wordpress/* $base"
# Delete dirs that are no longer needed
$ROOTCMD rm -rf $base/drupal-$ver
$ROOTCMD rm -rf $base/html
# Install the Apache configuration
$ROOTCMD ls -l /etc/apache2
$ROOTCMD cat <<EOM > /etc/apache2/sites-enabled/000-wordpress.conf
<VirtualHost *:80>
	ServerName $hostname
	DocumentRoot $base
	<Directory $base>
		AllowOverride all
	</Directory>
</VirtualHost>
EOM
$ROOTCMD a2dissite 000-default
$ROOTCMD a2ensite 000-wordpress
$ROOTCMD rm -f /etc/apache2/sites-enabled/000-default.conf
$ROOTCMD service apache2 restart
