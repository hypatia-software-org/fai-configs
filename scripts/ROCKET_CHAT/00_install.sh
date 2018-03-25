#!/bin/sh

fcopy -Bv /etc/init.d/rocket.chat
$ROOTCMD update-rc.d rocket.chat defaults
