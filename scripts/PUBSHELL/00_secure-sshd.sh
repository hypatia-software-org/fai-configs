#!/bin/bash

$ROOTCMD sed 's/.PasswordAuthentication.*/PasswordAuthentication no/' -i /etc/ssh/sshd_config
