#!/bin/bash
echo $PROXY_DOMAINS
for domainpair in $PROXY_DOMAINS; do
	public=`echo $domainpair | cut -d: -f1`
	private=`echo $domainpair | cut -d: -f2`
	port=`echo $domainpair | cut -d: -f3`
	if [ "" = "$port" ]; then
	   port=80
	fi
	cat > /etc/nginx/sites-available/$public.conf <<EOF
server {
	listen 443;
	server_name $public;

	error_log /var/log/nginx/$public.error.log;

	include /etc/nginx/ssl.conf;

EOF
	if [ $public = "chat.hypatiasoftware.org" ]; then
		cat >> /etc/nginx/sites-available/$public.conf <<EOF
	location / {
		proxy_pass http://$private:$port/;
		proxy_http_version 1.1;
		proxy_set_header Upgrade \$http_upgrade;
		proxy_set_header Connection "upgrade";
		proxy_set_header Host \$http_host;

		proxy_set_header X-Real-IP \$remote_addr;
		proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
		proxy_set_header X-Forwarded-Proto http;

		proxy_redirect off;
	}
}
EOF
	else
		cat >> /etc/nginx/sites-available/$public.conf <<EOF
	location / {
		proxy_pass http://$private:$port/;
		proxy_http_version 1.1;

		proxy_set_header X-Real-IP \$remote_addr;
		proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
		proxy_set_header X-Forwarded-Proto http;

		proxy_redirect off;
	}
}
EOF
	fi
	ln -s /etc/nginx/sites-available/$public.conf /etc/nginx/sites-enabled/
done
service nginx restart
