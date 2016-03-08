#!/bin/bash

if [ ! -d $GMG_PATH ]; then
    $ROOTCMD mkdir -p $GMG_PATH && $ROOTCMD chown -hR mediagoblin:www-data $GMG_PATH
fi
if [ ! -d $GMG_LOGPATH ]; then
    $ROOTCMD mkdir -p $GMG_LOGPATH && $ROOTCMD chown -hR mediagoblin:mediagoblin $GMG_LOGPATH
fi

