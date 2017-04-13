#!/bin/bash

if ! $ROOTCMD getent passwd $KIWIUSER ; then
    $ROOTCMD useradd -c "KiwiIRC system account" -d /srv/kiwi -m -r $KIWIUSER
    $ROOTCMD groupadd $KIWIGROUP && $ROOTCMD usermod --append -G $KIWIGROUP $KIWIUSER
fi

if [ ! -f $target/$KIWITARGET ]; then
    $ROOTCMD git clone https://github.com/prawnsalad/KiwiIRC.git $KIWITARGET
    cd $target/$KIWITARGET
    $ROOTCMD npm install
    
    fcopy -v /srv/kiwi/KiwiIRC/config.js
    $ROOTCMD ./kiwi build
    
    fcopy -v /etc/init.d/kiwi
    $ROOTCMD update-rc.d kiwi defaults
fi
