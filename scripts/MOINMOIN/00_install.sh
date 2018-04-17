#!/bin/sh
fcopy -Bv /etc/nginx/sites-available/moin.conf
ln -s /etc/nginx/sites-enabled/moin.conf /etc/nginx/sites-available/moin.conf
fcopy -Bv /etc/init.d/moinmoin
$ROOTCMD update-rc.d moinmoin defaults
$ROOTCMD service nginx restart
