#!/bin/bash

# Create mediagoblin user & group
$ROOTCMD sudo useradd -c "GNU MediaGoblin system account" -d /var/lib/mediagoblin -m -r -g nginx mediagoblin
$ROOTCMD sudo groupadd mediagoblin && sudo usermod --append -G mediagoblin mediagoblin
