#!/bin/bash

# Nuke permissions
$ROOTCMD chown -R root.www-data /var/www/html
$ROOTCMD chmod 750 /var/www/html
$ROOTCMD chown -R ikiwiki.www-data /var/www/html/wiki
$ROOTCMD find /var/www/html/wiki -type d -print0 | xargs -0 chmod 750
$ROOTCMD find /var/www/html/wiki -type f ! -name '*cgi' | xargs -0 chmod 640
$ROOTCMD chmod 6750 /var/www/html/wiki/ikiwiki.cgi
