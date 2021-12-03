#!/usr/bin/env sh

# This script checks if a restart is required on the current machine

if [ -f /var/run/reboot-required ]; then
  echo 'reboot required'
fi
