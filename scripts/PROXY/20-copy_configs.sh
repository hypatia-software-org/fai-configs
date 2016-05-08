#!/bin/bash

fcopy /etc/rsyslog.d/60-apache.conf
if [[ ! -d "$target/etc/apache2/include" ]]; then
    mkdir $target/etc/apache2/include
fi
fcopy /etc/apache2/include/log.conf
