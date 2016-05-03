#!/bin/bash

username=etherpad
gecos="Etherpad User"

if [[ ! $ROOTCMD getent passwd $username ]]; then
    $ROOTCMD adduser --system --disabled-password --gecos "$gecos" $username
fi
