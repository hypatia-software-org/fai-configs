#!/bin/sh

# Detect if ikikwiki is already installed
if [ ! -e /etc/ikiwiki/ikiwiki.setup ]; then
 # copy ikiwiki config
 fcopy -v /etc/ikiwiki/ikiwiki.setup

 # run setup
 $ROOTCMD ikiwiki --setup /etc/ikiwiki/auto.setup/DEFAULT
fi
