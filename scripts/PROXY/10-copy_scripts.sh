#!/bin/bash

fcopy /usr/local/bin/letsencrypt.sh

$ROOTCMD sed "s^LETSENCRYPT_PATH^$LETSENCRYPT_PATH^g" -i /usr/local/bin/letsencrypt.sh
$ROOTCMD sed "s/LETSENCRYPT_EMAIL/$LETSENCRYPT_EMAIL/g" -i /usr/local/bin/letsencrypt.sh

#Copy domains
dlist=''
for domain in $LETSENCRYPT_DOMAINS; do
    dlist="$dlist -e $domain"
done

$ROOTCMD sed "s/LETSENCRYPT_DOMAINS/$dlist/g" -i /usr/local/bin/letsencrypt.sh
