#!/bin/sh
$ROOTCMD npm install -g n
$ROOTCMD n 8.9.3
curl -L https://releases.rocket.chat/latest/download | zcat - | $ROOTCMD tar xf -
$ROOTCMD "cd Rocket.Chat && npm install"
$ROOTCMD rm -r Rocket.Chat
