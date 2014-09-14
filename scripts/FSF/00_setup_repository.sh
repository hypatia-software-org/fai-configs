#!/bin/bash

fcopy -v /etc/apt/sources.list.d/fsf-extras.list
$ROOTCMD wget mirror.fsf.org/fsfsys-trisquel/conf/lisam.gpg.key -O- | $ROOTCMD apt-key add -