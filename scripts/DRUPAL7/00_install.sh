#!/bin/sh

base=/var/www
ver=7.57
user=www-data
instance_url=https://my.hypatiasoftware.org

$ROOTCMD curl -L https://ftp.drupal.org/files/projects/drupal-$ver.tar.gz -o /tmp/drupal-$ver.tar.gz
$ROOTCMD mkdir -p $base
$ROOTCMD tar xzf /tmp/drupal-$ver.tar.gz -C$base/
$ROOTCMD rm -f /tmp/drupal-$ver.tar.gz
$ROOTCMD ls -l $base
$ROOTCMD sh -c "mv $base/drupal-$ver/* $base/drupal-$ver/.htaccess $base/drupal-$ver/.gitignore $base"
if [ ! -f $target$base/sites/default/settings.php ]; then
	# No configuration file exists, install the default one
	$ROOTCMD cp $base/sites/default/default.settings.php $base/sites/default/settings.php
	$ROOTCMD chown $user $base/sites/default/settings.php
	# Set base URL
	$ROOTCMD sed "s|# \$base_url = 'http://www.example.com'|\$base_url = '$instance_url'|g" \
	    -i $base/sites/default/settings.php
	# Uncomment RewriteBase in .htaccess
	$ROOTCMD sed 's|# RewriteBase /$|RewriteBase /|g' \
	    -i $base/.htaccess
fi
if [ ! -d $target$base/sites/default/files ]; then
	# Drupal needs this writable directory
	$ROOTCMD mkdir $base/sites/default/files
	$ROOTCMD chown $user $base/sites/default/files
fi
# Delete dirs that are no longer needed
$ROOTCMD rm -rf $base/drupal-$ver
$ROOTCMD rm -rf $base/html
# Install the Apache configuration
$ROOTCMD cat <<EOM > /etc/apache2/sites-enabled/000-drupal.conf
<VirtualHost *:80>
	#ServerName www.example.com
	DocumentRoot $base
	<Directory $base>
		AllowOverride all
	</Directory>
</VirtualHost>
EOM
$ROOTCMD a2dissite 000-default
$ROOTCMD a2ensite 000-drupal
$ROOTCMD rm -f /etc/apache2/sites-enabled/000-default.conf
$ROOTCMD a2enmod rewrite
$ROOTCMD service apache2 restart
