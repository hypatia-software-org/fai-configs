#!/bin/bash 
# add a demo user account
if ! $ROOTCMD getent passwd libreplanet ; then
    $ROOTCMD adduser --gecos "LibrePlanet Conference User" libreplanet
#    echo "demo:$ROOTPW" | $ROOTCMD chpasswd --encrypted
    $ROOTCMD usermod -p "$ROOTPW" libreplanet
fi
