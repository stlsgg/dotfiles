#!/bin/bash
# script take screenshot and saves it to $HOME/pics/screenshots directory
# name by date cmd
PIC_NAME="$(date "+%d.%m.%Y_%H_%M_%S").png"
PIC_PATH="$HOME/pics/screenshots/$PIC_NAME"

# take screenshot and save it
grim -g "$(slurp)" "$PIC_PATH"

# copy screenshot to clipboard
wl-copy < $PIC_PATH

