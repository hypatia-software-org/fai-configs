#!/bin/bash

$ROOTCMD curl -sL https://deb.nodesource.com/setup_16.x | bash -
$ROOTCMD apt update
$ROOTCMD apt-get -y install nodejs
