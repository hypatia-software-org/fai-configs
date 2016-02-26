#!/bin/bash


cd $target/$GMG_PATH
if [ ! -d mediagoblin ]; then

    $ROOTCMD git clone git://git.savannah.gnu.org/mediagoblin.git -b stable
    $ROOTCMD cd mediagoblin
    $ROOTCMD git submodule init && $ROOTCMD git submodule update


    $ROOTCMD ./bootstrap.sh && $ROOTCMD ./configure && $ROOTCMD make
    $ROOTCMD mkdir user_dev && $ROOTCMD chmod 750 user_dev
    $ROOTCMD ./bin/easy_install flup

fi

