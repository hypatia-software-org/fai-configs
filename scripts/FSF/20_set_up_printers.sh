#!/bin/bash

fcopy -v /etc/cups/client.conf
if $ROOTCMD test -f /etc/cups/printers.conf ; then
    $ROOTCMD rm -f /etc/cups/printers.conf
fi
