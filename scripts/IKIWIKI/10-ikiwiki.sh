#! /bin/bash

# add a ikiwiki user account
if ! $ROOTCMD getent passwd ikiwki ; then
    $ROOTCMD adduser --system --ingroup www-data --disabled-password --gecos "ikiwiki user" ikiwiki

fi
