#!/bin/bash

if [ ! -d $LETSENCRYPT_PATH/letsencrypt ]; then
    cd $target/$LETSENCRYPT_PATH
    git clone https://github.com/letsencrypt/letsencrypt
fi
fcopy -Bv /etc/init.d/request-letsencrypt

$ROOTCMD sed 's^LETSENCRYPT_EMAIL_TOKEN^'$LETSENCRYPT_EMAIL'^g' -i /etc/init.d/request-letsencrypt
$ROOTCMD sed 's^SERVERNAME_TOKEN^'$SERVERNAME'^g' -i /etc/init.d/request-letsencrypt
$ROOTCMD sed 's^HOSTNAME_TOKEN^'$HOSTNAME'^g' -i /etc/init.d/request-letsencrypt

if [ $LETSENCRYPT_SKIP = 1 ]; then
    $ROOTCMD touch /etc/skip.letsencrypt
fi

$ROOTCMD update-rc.d request-letsencrypt defaults
