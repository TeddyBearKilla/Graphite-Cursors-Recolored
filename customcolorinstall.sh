#!/usr/bin/env/bash

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

if [ -d "$DEST_DIR/$GR-Purple" ]; then rm -r "$DEST_DIR/$GR-Purple"; fi
if [ -d "$DEST_DIR/$GRD-Teddy" ]; then rm -r "$DEST_DIR/$GRD-Teddy"; fi

cd $D/

cp -r $D-purple/ $DEST_DIR/$GR-Purple
cp -r $DD-teddy/ $DEST_DIR/$GRD-Teddy

echo "Finished..."

