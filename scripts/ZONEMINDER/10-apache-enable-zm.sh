#! /bin/sh

# create/link apache configs
ln -sf $target/etc/zm/apache.conf $target/etc/apache2/conf-available/zoneminder.conf
fcopy -v /etc/apache2/conf-available/redirect-to-zm.conf

# enable apache configs
ln -sf $target/etc/apache2/conf-available/zoneminder.conf $target/etc/apache2/conf-enabled/
ln -sf $target/etc/apache2/conf-available/redirect-to-zm.conf $target/etc/apache2/conf-enabled/

