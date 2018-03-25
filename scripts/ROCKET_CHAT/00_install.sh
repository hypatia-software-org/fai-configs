#!/bin/sh
$ROOTCMD npm install -g n
$ROOTCMD n 8.9.3
curl -L https://releases.rocket.chat/latest/download | zcat - | $ROOTCMD tar xf -
$ROOTCMD mv bundle Rocket.Chat
$ROOTCMD ls -l
$ROOTCMD ls -l bundle
$ROOTCMD sh -c "cd Rocket.Chat/Programs/server && npm install"

