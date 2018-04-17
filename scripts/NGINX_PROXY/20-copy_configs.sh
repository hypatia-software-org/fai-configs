#!/bin/bash
echo $PROXY_DOMAINS
for domainpair in $PROXY_DOMAINS; do
    echo o
    public=`echo $domainpair | cut -d: -f1`
    echo $public
    private=`echo $domainpair | cut -d: -f2`
    echo $private
    port=`echo $domainpair | cut -d: -f3`
    echo $port
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
	    proxy_set_header Upgrade \$http_upgrade;
	    proxy_set_header Connection "upgrade";
	    proxy_set_header Host \$http_host;

	    proxy_set_header X-Real-IP \$remote_addr;
	    proxy_set_header X-Forward-For \$proxy_add_x_forwarded_for;
	    proxy_set_header X-Forward-Proto http;
	    proxy_set_header X-Nginx-Proxy true;

	    proxy_redirect off;
    }
}
EOF
    ln -s /etc/nginx/sites-available/$public.conf /etc/nginx/sites-enabled/
done
service nginx restart
