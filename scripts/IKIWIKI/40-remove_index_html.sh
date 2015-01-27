#! /bin/sh

# gets in the way of wordpress's index.php
if $ROOTCMD -e test /var/www/index.htm; then
    $ROOTCMD rm /var/www/index.htm
fi
