#! /bin/bash

# Download mediawiki directly from their download source, as it is the recommended route and there is no repo
if ! $ROOTCMD getent passwd mediawiki ; then
    $ROOTCMD adduser --system --ingroup www-data --disabled-password --gecos "mediawiki user" mediawiki
fi

if ! $ROOTCMD test -e /home/mediawiki/.ssh/id_rsa; then
    $ROOTCMD echo | $ROOTCMD sudo -u mediawiki ssh-keygen -N ''
fi

if ! $ROOTCMD echo | cd /home/mediawiki/ 
    $HOME && wget https://releases.wikimedia.org/mediawiki/1.25/mediawiki-1.25.1.tar.gz; then
    tar -xvzf $HOME\mediawiki-1.25.1.tar.gz 
    mv mediawiki-*/* /var/www/html
fi



