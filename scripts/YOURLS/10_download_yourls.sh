#! /bin/bash

YOURLS_VERS='1.7.1'

# Download yourls and install; we're going to be doing this under the gnusocial user.
if ! $ROOTCMD getent passwd gnusocial ; then
    $ROOTCMD adduser --system --ingroup www-data --disabled-password --gecos "gnusocial user" gnusocial
fi

if ! $ROOTCMD test -e /home/gnusocial/.ssh/id_rsa; then
    $ROOTCMD echo | $ROOTCMD sudo -u gnusocial ssh-keygen -N ''
fi

if ! $ROOTCMD echo | cd /home/gnusocial/ 
    mkdir /var/www/yourls
    curl https://codeload.github.com/YOURLS/YOURLS/tar.gz/$YOURLS_VERS -o /home/gnusocial/yourls.tar.gz; then
    tar xf /home/gnusocial/yourls.tar.gz -C /home/gnusocial/
    mv /home/gnusocial/YOURLS-$YOURLS_VERS/* /var/www/yourls/
fi
