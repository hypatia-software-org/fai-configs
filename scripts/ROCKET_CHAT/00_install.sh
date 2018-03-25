#!/bin/sh
curl -L https://deb.nodesource.com/setup_8.x | $ROOTCMD bash -
$ROOTCMD apt-get install -y nodejs
curl -L https://releases.rocket.chat/latest/download | zcat - | $ROOTCMD tar xf -
$ROOTCMD mv bundle Rocket.Chat
$ROOTCMD su -c "cd /Rocket.Chat && npm install"
