#!/bin/sh
curl -L https://deb.nodesource.com/setup_8.x | $ROOTCMD bash -
$ROOTCMD apt-get install -y nodejs
curl -L https://releases.rocket.chat/latest/download | zcat - | $ROOTCMD tar xf -
$ROOTCMD mv bundle Rocket.Chat
$ROOTCMD sh -c "cd /Rocket.Chat && npm install"
# I don't understand why this is needed yet
uid=`ls -l $target | grep bin | cut -d' ' -f5 | head -1`
chown -R $uid:$uid $target/root/.npm
