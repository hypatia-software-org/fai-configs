#!/bin/bash

username=etherpad
gecos="Etherpad User"
repolocation="https://github.com/ether/etherpad-lite.git"

$ROOTCMD getent passwd $username
if [[ ! $? -eq 0 ]]; then
    $ROOTCMD adduser --system --disabled-password --gecos "$gecos" $username
fi

if [[ ! -d $target/usr/src/etherpad ]]; then
    $ROOTCMD git clone $repolocation /usr/src/etherpad
fi

fcopy /usr/src/etherpad/settings.json

$ROOTCMD chown -R $username /usr/src/etherpad
