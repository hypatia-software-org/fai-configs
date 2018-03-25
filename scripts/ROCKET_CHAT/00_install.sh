#!/bin/sh

curl -L https://deb.nodesource.com/setup_8.x | $ROOTCMD bash -
$ROOTCMD apt-get install -y nodejs

curl -L https://releases.rocket.chat/latest/download | zcat - | $ROOTCMD tar xf --no-same-owner -
$ROOTCMD mv bundle Rocket.Chat

fcopy -Bv /etc/init.d/rocket.chat
$ROOTCMD update-rc.d rocket.chat defaults
