#!/bin/bash

FILE=$HOME/.config/i3/blinfo
if [ -f $FILE ]; then
  blvalue=$(cat $FILE)
  if [ $blvalue -eq 2 ] || [ $blvalue -gt 2 ]; then
    blvalue=0
  else
    blvalue=$(( $blvalue + 1 ))
  fi
else
  blvalue=1
fi

sudo sh -c "echo $blvalue > /sys/class/leds/tpacpi::kbd_backlight/brightness"
echo "$blvalue" > $FILE
