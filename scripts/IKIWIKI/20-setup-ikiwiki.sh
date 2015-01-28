#!/bin/sh

# Detect if ikikwiki is already installed
if ! $ROOTCMD test -e /etc/ikiwiki/ikiwiki.setup ; then
 # copy ikiwiki config
 fcopy -v /etc/ikiwiki/ikiwiki.setup

 # run setup
 $ROOTCMD sudo -u ikiwiki ikiwiki --setup /etc/ikiwiki/ikiwiki.setup
 # Fix the local gitrepo
  $ROOTCMD sudo -u ikiwiki ikiwiki git clone git@vcs.fsf.org:gluestick.git
fi


