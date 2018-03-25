#!/bin/sh
# I don't understand why this chmod stuff is needed yet
uid=`ls -l $target | grep bin | cut -d' ' -f5 | head -1`

curl -L https://deb.nodesource.com/setup_8.x | $ROOTCMD bash -
$ROOTCMD apt-get install -y nodejs
curl -L https://releases.rocket.chat/latest/download | zcat - | $ROOTCMD tar xf -
chown -R $uid:$uid $target/bundle
$ROOTCMD mv bundle Rocket.Chat
$ROOTCMD sh -c "cd /Rocket.Chat && npm install"
chown -R $uid:$uid $target/root/.npm
