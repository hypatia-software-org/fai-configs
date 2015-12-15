#! /bin/bash

# Download gnusocial directly from their download source, as it is the recommended route and there is no repo
if ! $ROOTCMD getent passwd gnusocial ; then
    $ROOTCMD adduser --system --ingroup www-data --disabled-password --gecos "gnusocial user" gnusocial
fi

if ! $ROOTCMD test -e /home/gnusocial/.ssh/id_rsa; then
    $ROOTCMD echo | $ROOTCMD sudo -u gnusocial ssh-keygen -N ''
fi

if ! $ROOTCMD echo | cd /home/gnusocial/ 
    git clone https://git.gnu.io/gnu/gnu-social.git /home/gnusocial/gnu-social; then
    rm -rf /home/gnusocial/gnu-social/.git
    mv /home/gnusocial/gnu-social/* /var/www/html
fi
