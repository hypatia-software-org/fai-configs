#!/bin/bash



fcopy /etc/rsyslog.d/60-apache.conf
if [[ ! -d "$target/etc/apache2/include" ]]; then
    mkdir $target/etc/apache2/include
fi
fcopy /etc/apache2/include/log.conf

sum=`echo $PROXY_DOMAINS | md5sum | cut -d\  -f1`
grep $sum $PROXY_DOMAINS_HASH &>/dev/null

if [[ $? -ne 0 ]]; then
    for domainpair in $PROXY_DOMAINS; do
	public=`echo $domainpair | cut -d: -f1`
	private=`echo $domainpair | cut -d: -f2`
	port=`echo $domainpair | cut -d: -f3`
	if [ "" = "$port" ]; then
	   port=80
	fi
	cat > /etc/apache2/sites-available/$public.conf <<EOF
<VirtualHost *:80>
    ServerName $public
    Redirect "/" "https://$public/"
</VirtualHost>

<VirtualHost *:443>
    ServerName $public
    ProxyPreserveHost On
    ProxyPass / http://$private:$port/
    ProxyPassReverse / http://$private:$port/
    SSLEngine On
    Include /etc/apache2/ssl.conf
#    Include /etc/apache2/include/log.conf
#    CustomLog "|/usr/bin/logger -t httpd-chat.$public -p local6.info" combined
</VirtualHost>

EOF
	a2ensite $public
    done
    service apache2 reload
    echo $sum > $PROXY_DOMAINS_HASH 
fi
