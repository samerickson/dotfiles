#!/bin/zsh
# If not running interactively, don't do anything
#[ -z "$PS1" ] && return

export DISPLAY=$(awk '/nameserver / {print $2; exit}' /etc/resolv.conf 2>/dev/null):0
export LIBGL_ALWAYS_INDIRECT=1

dbus_status=$(service dbus status)
if [[ $dbus_status = *"is not running"* ]]; then
  sudo service dbus --full-restart
fi

i3 > "${XDG_CACHE_HOME:-$HOME/.cache}/i3/i3-launch.log"
