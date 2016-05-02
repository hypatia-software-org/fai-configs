#!/bin/bash

if [[ ! -d $target/var/www/$SERVERNAME ]]; then
    $ROOTCMD rm -rf /var/www/html
    wget -O- http://www.pmwiki.org/pub/pmwiki/pmwiki-2.2.86.tgz | tar xzf - -C$target/var/www/
    $ROOTCMD mv /var/ww/pmwiki-2.2.86 /var/www/$SERVERNAME

    cat <<EOF >$target/etc/apache2/sites-available/$SERVERNAME.conf
<VirtualHost _default_:80>
   ServerName  $SERVERNAME
   ServerAlias $HOSTNAME
   ServerAdmin sysadmin@ftee.org

   DocumentRoot /var/www/$SERVERNAME
   <Directory /var/www/$SERVERNAME>
      Options Indexes FollowSymLinks
      AllowOverride all
      Require all granted
   </Directory>

   ErrorLog \${APACHE_LOG_DIR}/http-$HOSTNAME.error.log
   CustomLog \${APACHE_LOG_DIR}/http-$HOSTNAME.access.log combined

</VirtualHost>

EOF
    $ROOTCMD a2dissite 00-default
    $ROOTCMD a2ensite $SERVERNAME
fi
