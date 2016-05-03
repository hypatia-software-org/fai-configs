#!/bin/bash

username=etherpad
gecos="Etherpad User"

$ROOTCMD getent passwd $username
if [[ $? -eq 0 ]]; then
    $ROOTCMD adduser --system --disabled-password --gecos "$gecos" $username
fi
