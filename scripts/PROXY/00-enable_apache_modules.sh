#!/bin/bash

apachedir=/etc/apache2
emod=$apachedir/mods-enabled
amod=$apachedir/mods-available

mods=("proxy.conf" "proxy.load" "proxy_connect.load" "proxy_http.load" "proxy_html.load" "ssl.conf" "ssl.load" "xml2enc.load" "socache_shmcb.load")

for mod in "${mods[@]}"
do
    $ROOTCMD ln -s $amod/$mod $emod/$mod
done
