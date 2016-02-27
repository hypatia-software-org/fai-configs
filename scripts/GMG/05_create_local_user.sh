#!/bin/bash

# Create mediagoblin user & group
$ROOTCMD useradd -c "GNU MediaGoblin system account" -d /var/lib/mediagoblin -m -r -g www-data mediagoblin
$ROOTCMD groupadd mediagoblin && sudo usermod --append -G mediagoblin mediagoblin
