#!/bin/bash

repolocation="https://github.com/ether/etherpad-lite.git"

if [[ ! -d $target/usr/src/etherpad ]]; then
    $ROOTCMD git clone $repolocation /usr/src/etherpad
fi
