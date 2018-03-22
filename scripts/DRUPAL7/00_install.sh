#!/bin/sh

base=/var/www
ver=7.57
user=www-data

$ROOTCMD mkdir -p $base
$ROOTCMD rm -rf $base/*
$ROOTCMD curl -L https://ftp.drupal.org/files/projects/drupal-$ver.tar.gz | tar xzf - -C$base/
$ROOTCMD mv $base/drupal-$ver/* $base/drupal-$ver/.htaccess $base/drupal-$ver/.gitignore $base
$ROOTCMD cp $base/sites/default/default.settings.php $base/sites/default/settings.php
$ROOTCMD chown $user $base/sites/default/settings.php
$ROOTCMD mkdir $base/sites/default/files
$ROOTCMD chown $user $base/sites/default/files
$ROOTCMD rm -rf $base/drupal-$ver
$ROOTCMD rm -rf $base/html
