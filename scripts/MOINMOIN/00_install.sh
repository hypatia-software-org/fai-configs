#!/bin/sh
fcopy -Bv /etc/nginx/sites-available/moin.conf
ln -s /etc/nginx/sites-enabled/moin.conf /etc/nginx/sites-available/moin.conf
service nginx restart


