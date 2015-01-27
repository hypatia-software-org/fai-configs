#! /bin/bash

# add a ikiwiki user account
if ! $ROOTCMD getent passwd ikiwki ; then
    $ROOTCMD adduser --system --ingroup www-data --disabled-password --gecos "ikiwiki user" ikiwiki
fi

if ! $ROOTCMD test -e /home/ikiwiki/.ssh/id_rsa; then
    $ROOTCMD echo | $ROOTCMD sudo -u ikiwiki ssh-keygen -N ''
fi
