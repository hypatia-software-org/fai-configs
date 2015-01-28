#!/bin/sh

# Detect if ikikwiki is already installed
if ! $ROOTCMD test -e /etc/ikiwiki/ikiwiki.setup ; then
 # copy ikiwiki config
 fcopy -v /etc/ikiwiki/ikiwiki.setup

 # run setup
 $ROOTCMD sudo -u ikiwiki ikiwiki --setup /etc/ikiwiki/ikiwiki.setup
fi

# Fix the local gitrepo
fcopy /srv/ikiwiki/wiki.git/config
