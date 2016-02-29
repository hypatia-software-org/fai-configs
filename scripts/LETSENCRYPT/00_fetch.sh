#!/bin/bash

if [ ! -d $LETSENCRYPT_PATH/letsencrypt ]; then
    cd $target/$LETSENCRYPT_PATH
    git clone https://github.com/letsencrypt/letsencrypt
fi
fcopy -Bv /etc/init.d/request-letsencrypt
$ROOTCMD update-rc.d request-letsencrypt defaults
