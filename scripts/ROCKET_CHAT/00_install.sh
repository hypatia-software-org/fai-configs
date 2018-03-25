#!/bin/sh
$ROOTCMD npm install -g n
$ROOTCMD n 8.9.3
curl -L https://releases.rocket.chat/latest/download | zcat - | $ROOTCMD tar xf -
$ROOTCMD "cd bundle && npm install"
$ROOTCMD rm -r bundle
