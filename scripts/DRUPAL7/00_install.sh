#!/usr/bin/env bash

if [[ ! -d $target/var/www/$SERVERNAME ]]; then
	$ROOTCMD rm -rf /var/www/html
	curl -L https://ftp.drupal.org/files/projects/drupal-7.57.tar.gz | tar xzf - -C$target/var/www/
	$ROOTCMD mv /var/www/drupal-7.57 /var/www

	cat <<EOF >$target/etc/apache2/apache2.conf
<VirtualHost _default_:80>
   DocumentRoot /var/www
   <Directory /var/www>
      Options Indexes FollowSymLinks
      AllowOverride all
      Require all granted
   </Directory>
</VirtualHost>

EOF

fi
