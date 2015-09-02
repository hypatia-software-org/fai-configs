#!/bin/bash

export DEBIAN_FRONTEND=noninteractive

$ROOTCMD apt-get -y --force-yes update
$ROOTCMD apt-get -y --force-yes install spd-perl
