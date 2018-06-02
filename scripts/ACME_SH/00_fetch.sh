#!/bin/sh
$ROOTCMD curl -L https://raw.githubusercontent.com/Neilpang/acme.sh/master/acme.sh -o /usr/local/bin/acme.sh
$ROOTCMD chmod +x /usr/local/bin/acme.sh
fcopy -Bv /usr/local/bin/acme-update.sh
fcopy -Bv /etc/cron.d/acme
domain_list=''
for domain in $LETSENCRYPT_DOMAINS; do
	domain_list="$domain_list -d $domain"
done
$ROOTCMD sed "s/LETSENCRYPT_DOMAINS/$domain_list/g" -i /usr/local/bin/acme-update.sh
