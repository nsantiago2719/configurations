#!/bin/bash
title=`dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.freedesktop.DBus.Properties.Get string:'org.mpris.MediaPlayer2.Player' string:'Metadata'|egrep -A 1 "title"|egrep -v "title"|cut -b 44-|cut -d '"' -f 1|egrep -v ^$`

if [[ ${#title} -gt 22 ]]; then
  title=$(echo $title | cut -c-22)
  echo "$title ..."
else
  echo $title
fi
