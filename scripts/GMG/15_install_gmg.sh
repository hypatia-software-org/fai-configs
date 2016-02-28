#!/bin/bash

fcopy -v /etc/init.d/install-mediagoblin
$ROOTCMD update-rc.d install-mediagoblin defaults

