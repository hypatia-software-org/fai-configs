#!/bin/bash

# Create mediagoblin user & group
if ! $ROOTCMD getent passwd mediagoblin ; then
    $ROOTCMD useradd -c "GNU MediaGoblin system account" -d /var/lib/mediagoblin -m -r -g www-data mediagoblin
    $ROOTCMD groupadd mediagoblin && $ROOTCMD usermod --append -G mediagoblin mediagoblin
fi
