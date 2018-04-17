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
	cat > /etc/nginx/sites-available/$public.conf <<EOF
upstream backend {
        server $private:$port;
}

server {
        listen 443;
        server_name $public;

        error_log /var/log/nginx/$public.error.log;

        include /etc/nginx/ssl.conf;

        location / {
                proxy_pass http://backend/;
                proxy_http_version 1.1;
                proxy_set_header Upgrade $http_upgrade;
                proxy_set_header Connection "upgrade";
                proxy_set_header Host $http_host;

                proxy_set_header X-Real-IP $remote_addr;
                proxy_set_header X-Forward-For $proxy_add_x_forwarded_for;
                proxy_set_header X-Forward-Proto http;
                proxy_set_header X-Nginx-Proxy true;

                proxy_redirect off;
        }
}
EOF
    ln -s /etc/nginx/sites-available/$public.conf /etc/nginx/sites-enabled/
    done
    service nginx reload
    echo $sum > $PROXY_DOMAINS_HASH 
fi
