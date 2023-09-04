#!/bin/bash

ROOT_UID=0
DEST_DIR=
GR=Graphite-Recolored
GRC=Graphite-Recolored-Catppuccin
GRD=Graphite-Recolored-Dracula
GRG=Graphite-Recolored-Gruvbox
D=dist
DC=dist-cat
DD=dist-dracula
DG=dist-gruvbox

# Destination directory
if [ "$UID" -eq "$ROOT_UID" ]; then
  DEST_DIR="/usr/share/icons"
else
  DEST_DIR="$HOME/.local/share/icons"
fi

if [ -d "$DEST_DIR/$GRC-Purple" ]; then rm -r "$DEST_DIR/$GRC-Purple"; fi

cd $D/

cp -r $DC-purple/ $DEST_DIR/$GRC-Purple

echo "Finished..."
