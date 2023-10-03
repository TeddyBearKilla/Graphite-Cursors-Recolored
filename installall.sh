#!/usr/bin/env bash

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

if [ -d "$DEST_DIR/$GR-Joris" ]; then rm -r "$DEST_DIR/$GR-Joris"; fi
if [ -d "$DEST_DIR/$GR-Joris2" ]; then rm -r "$DEST_DIR/$GR-Joris2"; fi
if [ -d "$DEST_DIR/$GR-Joris3" ]; then rm -r "$DEST_DIR/$GR-Joris3"; fi
if [ -d "$DEST_DIR/$GR-Joris4" ]; then rm -r "$DEST_DIR/$GR-Joris4"; fi
if [ -d "$DEST_DIR/$GR-Blue" ]; then rm -r "$DEST_DIR/$GR-Blue"; fi
if [ -d "$DEST_DIR/$GR-Purple" ]; then rm -r "$DEST_DIR/$GR-Purple"; fi
if [ -d "$DEST_DIR/$GRC-Blue" ]; then rm -r "$DEST_DIR/$GRC-Blue"; fi
if [ -d "$DEST_DIR/$GRC-Flamingo" ]; then rm -r "$DEST_DIR/$GRC-Flamingo"; fi
if [ -d "$DEST_DIR/$GRC-Green" ]; then rm -r "$DEST_DIR/$GRC-Green"; fi
if [ -d "$DEST_DIR/$GRC-Macchiato" ]; then rm -r "$DEST_DIR/$GRC-Macchiato"; fi
if [ -d "$DEST_DIR/$GRC-Maroon" ]; then rm -r "$DEST_DIR/$GRC-Maroon"; fi
if [ -d "$DEST_DIR/$GRC-Mauve" ]; then rm -r "$DEST_DIR/$GRC-Mauve"; fi
if [ -d "$DEST_DIR/$GRC-Peach" ]; then rm -r "$DEST_DIR/$GRC-Peach"; fi
if [ -d "$DEST_DIR/$GRC-Pink" ]; then rm -r "$DEST_DIR/$GRC-Pink"; fi
if [ -d "$DEST_DIR/$GRC-Red" ]; then rm -r "$DEST_DIR/$GRC-Red"; fi
if [ -d "$DEST_DIR/$GRC-Rosewater" ]; then rm -r "$DEST_DIR/$GRC-Rosewater"; fi
if [ -d "$DEST_DIR/$GRC-Sapphire" ]; then rm -r "$DEST_DIR/$GRC-Sapphire"; fi
if [ -d "$DEST_DIR/$GRC-Sky" ]; then rm -r "$DEST_DIR/$GRC-Sky"; fi
if [ -d "$DEST_DIR/$GRC-Teal" ]; then rm -r "$DEST_DIR/$GRC-Teal"; fi
if [ -d "$DEST_DIR/$GRC-Yellow" ]; then rm -r "$DEST_DIR/$GRC-Yellow"; fi
if [ -d "$DEST_DIR/$GRD-Cyan" ]; then rm -r "$DEST_DIR/$GRD-Cyan"; fi
if [ -d "$DEST_DIR/$GRD-Green" ]; then rm -r "$DEST_DIR/$GRD-Green"; fi
if [ -d "$DEST_DIR/$GRD-Orange" ]; then rm -r "$DEST_DIR/$GRD-Orange"; fi
if [ -d "$DEST_DIR/$GRD-Pink" ]; then rm -r "$DEST_DIR/$GRD-Pink"; fi
if [ -d "$DEST_DIR/$GRD-Purple" ]; then rm -r "$DEST_DIR/$GRD-Purple"; fi
if [ -d "$DEST_DIR/$GRD-Red" ]; then rm -r "$DEST_DIR/$GRD-Red"; fi
if [ -d "$DEST_DIR/$GRD-Teddy" ]; then rm -r "$DEST_DIR/$GRD-Teddy"; fi
if [ -d "$DEST_DIR/$GRD-Yellow" ]; then rm -r "$DEST_DIR/$GRD-Yellow"; fi
if [ -d "$DEST_DIR/$GRG-Aqua" ]; then rm -r "$DEST_DIR/$GRG-Aqua"; fi
if [ -d "$DEST_DIR/$GRG-Black" ]; then rm -r "$DEST_DIR/$GRG-Black"; fi
if [ -d "$DEST_DIR/$GRG-Blue" ]; then rm -r "$DEST_DIR/$GRG-Blue"; fi
if [ -d "$DEST_DIR/$GRG-Gray" ]; then rm -r "$DEST_DIR/$GRG-Gray"; fi
if [ -d "$DEST_DIR/$GRG-Green" ]; then rm -r "$DEST_DIR/$GRG-Green"; fi
if [ -d "$DEST_DIR/$GRG-Mojas84" ]; then rm -r "$DEST_DIR/$GRG-Mojas84"; fi
if [ -d "$DEST_DIR/$GRG-Orange" ]; then rm -r "$DEST_DIR/$GRG-Orange"; fi
if [ -d "$DEST_DIR/$GRG-Purple" ]; then rm -r "$DEST_DIR/$GRG-Purple"; fi
if [ -d "$DEST_DIR/$GRG-White" ]; then rm -r "$DEST_DIR/$GRG-White"; fi

cd $D/

cp -r $D-joris/ $DEST_DIR/$GR-Joris
cp -r $D-joris2/ $DEST_DIR/$GR-Joris2
cp -r $D-joris3/ $DEST_DIR/$GR-Joris3
cp -r $D-joris4/ $DEST_DIR/$GR-Joris4
cp -r $D-blue/ $DEST_DIR/$GR-Blue
cp -r $D-purple/ $DEST_DIR/$GR-Purple
cp -r $DC-blue/ $DEST_DIR/$GRC-Blue
cp -r $DC-flamingo/ $DEST_DIR/$GRC-Flamingo
cp -r $DC-green/ $DEST_DIR/$GRC-Green
cp -r $DC-macchiato/ $DEST_DIR/$GRC-Macchiato
cp -r $DC-maroon/ $DEST_DIR/$GRC-Maroon
cp -r $DC-mauve/ $DEST_DIR/$GRC-Mauve
cp -r $DC-peach/ $DEST_DIR/$GRC-Peach
cp -r $DC-pink/ $DEST_DIR/$GRC-Pink
cp -r $DC-red/ $DEST_DIR/$GRC-Red
cp -r $DC-rosewater/ $DEST_DIR/$GRC-Rosewater
cp -r $DC-sapphire/ $DEST_DIR/$GRC-Sapphire
cp -r $DC-sky/ $DEST_DIR/$GRC-Sky
cp -r $DC-teal/ $DEST_DIR/$GRC-Teal
cp -r $DC-yellow/ $DEST_DIR/$GRC-Yellow
cp -r $DC-sky/ $DEST_DIR/$GRC-Sky
cp -r $DD-cyan/ $DEST_DIR/$GRD-Cyan
cp -r $DD-green/ $DEST_DIR/$GRD-Green
cp -r $DD-orange/ $DEST_DIR/$GRD-Orange
cp -r $DD-pink/ $DEST_DIR/$GRD-Pink
cp -r $DD-purple/ $DEST_DIR/$GRD-Purple
cp -r $DD-red/ $DEST_DIR/$GRD-Red
cp -r $DD-teddy/ $DEST_DIR/$GRD-Teddy
cp -r $DD-yellow/ $DEST_DIR/$GRD-Yellow
cp -r $DG-aqua/ $DEST_DIR/$GRG-Aqua
cp -r $DG-black/ $DEST_DIR/$GRG-Black
cp -r $DG-blue/ $DEST_DIR/$GRG-Blue
cp -r $DG-gray/ $DEST_DIR/$GRG-Gray
cp -r $DG-green/ $DEST_DIR/$GRG-Green
cp -r $DG-mojas84/ $DEST_DIR/$GRG-Mojas84
cp -r $DG-orange/ $DEST_DIR/$GRG-Orange
cp -r $DG-purple/ $DEST_DIR/$GRG-Purple
cp -r $DG-white/ $DEST_DIR/$GRG-White

echo "Finished..."

