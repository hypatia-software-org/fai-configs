#!/bin/sh

base=/var/www
ver=7.57
user=www-data

$ROOTCMD curl -L https://ftp.drupal.org/files/projects/drupal-$ver.tar.gz -o /tmp/drupal-$ver.tar.gz
$ROOTCMD mkdir -p $base
$ROOTCMD tar xzf /tmp/drupal-$ver.tar.gz -C$base/
$ROOTCMD rm -f /tmp/drupal-$ver.tar.gz
$ROOTCMD ls -l $base
$ROOTCMD sh -c "mv $base/drupal-$ver/* $base/drupal-$ver/.htaccess $base/drupal-$ver/.gitignore $base"
if [ ! -f $base/sites/default/settings.php ]; then
	$ROOTCMD cp $base/sites/default/default.settings.php $base/sites/default/settings.php
	$ROOTCMD chown $user $base/sites/default/settings.php
fi
if [ ! -d $base/sites/default/files ]; then
	$ROOTCMD mkdir $base/sites/default/files
	$ROOTCMD chown $user $base/sites/default/files
fi
$ROOTCMD rm -rf $base/drupal-$ver
$ROOTCMD rm -rf $base/html
