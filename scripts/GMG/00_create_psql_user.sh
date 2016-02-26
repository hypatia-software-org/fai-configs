#!/bin/bash

# Create the GMG user
$ROOTCMD sudo -u postgres createuser -A -D mediagoblin
# Create GMG database
$ROOTCMD sudo -u postgres createdb -E UNICODE -O mediagoblin mediagoblin


