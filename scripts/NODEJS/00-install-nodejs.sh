#!/bin/bash

$ROOTCMD curl -sL https://deb.nodesource.com/setup_16.x > $target/tmp/node.sh
$ROOTCMD bash /tmp/node.js
$ROOTCMD apt-get -y install nodejs
