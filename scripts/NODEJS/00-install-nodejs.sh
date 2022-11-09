#!/bin/bash -x

$ROOTCMD curl -sL https://deb.nodesource.com/setup_16.x | $ROOTCMD bash - 
$ROOTCMD apt-get -y install nodejs
