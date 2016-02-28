#!/bin/bash

if [ ! -d $GMG_PATH ]; then
    $ROOTCMD mkdir -p $GMG_PATH && $ROOTCMD chown -hR mediagoblin:www-data $GMG_PATH
fi

