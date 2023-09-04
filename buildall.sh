#!/bin/bash

#  Check command avalibility
function has_command() {
  command -v $1 > /dev/null
}

if [[ ! "$(which xcursorgen 2> /dev/null)" ]]; then echo xorg-xcursorgen needs to be installed to generate the cursors.; if has_command zypper; then sudo zypper in xorg-xcursorgen; elif has_command apt; then sudo apt install xorg-xcursorgen; elif has_command dnf; then sudo dnf install -y xorg-xcursorgen; elif has_command dnf; then sudo dnf install xorg-xcursorgen; elif has_command pacman; then sudo pacman -S --noconfirm xorg-xcursorgen; fi; fi

if [[ ! "$(which inkscape 2> /dev/null)" ]]; then echo inkscape needs to be installed to generate the cursors.; if has_command zypper; then sudo zypper in inkscape; elif has_command apt; then sudo apt install inkscape; elif has_command dnf; then sudo dnf install -y inkscape; elif has_command dnf; then sudo dnf install inkscape; elif has_command pacman; then sudo pacman -S --noconfirm inkscape; fi; fi

function create {
cd "$SRC"; mkdir -p x1 x1_25 x1_5 x2; cd "$SRC"/$1
	find . -name "*.svg" -type f -exec sh -c 'inkscape -o "../x1/${0%.svg}.png" -w 32 -h 32 $0' {} \;
	find . -name "*.svg" -type f -exec sh -c 'inkscape -o "../x1_25/${0%.svg}.png" -w 40 -w 40 $0' {} \;
	find . -name "*.svg" -type f -exec sh -c 'inkscape -o "../x1_5/${0%.svg}.png" -w 48 -w 48 $0' {} \;
	find . -name "*.svg" -type f -exec sh -c 'inkscape -o "../x2/${0%.svg}.png" -w 64 -w 64 $0' {} \;
	cd "$SRC"; OUTPUT="$BUILD"/cursors ALIASES="$SRC"/cursorList

	if [ ! -d "$BUILD" ]; then mkdir "$BUILD"; fi
	if [ ! -d "$OUTPUT" ]; then mkdir "$OUTPUT"; fi

	echo -ne "Generating cursor theme...\\r"
	for CUR in config/*.cursor; do
		BASENAME="$CUR"
		BASENAME="${BASENAME##*/}"
		BASENAME="${BASENAME%.*}"
		xcursorgen "$CUR" "$OUTPUT/$BASENAME"; done
	echo -e "Generating cursor theme... DONE"

	cd "$OUTPUT"	#generate aliases

	echo -ne "Generating shortcuts...\\r"
	while read ALIAS; do
	FROM="${ALIAS#* }"
	TO="${ALIAS% *}"

		if [ -e $TO ]; then
		continue; fi
		ln -sr "$FROM" "$TO"; done < "$ALIASES"
	echo -e "Generating shortcuts... DONE"

	cd "$PWD"

	echo -ne "Generating Theme Index...\\r"
	INDEX="$OUTPUT/../index.theme"
	if [ ! -e "$OUTPUT/../$INDEX" ]; then
	touch "$INDEX"
		echo -e "[Icon Theme]\nName=$THEME\nComment=$THEME Cursor pack.\n" > "$INDEX"; fi
	echo -e "Generating Theme Index... DONE"
}

# generate pixmaps from svg source
SRC=$PWD/src
cd "$SRC"
rm -rf joris joris2 joris3 joris4 blue purple cat-blue cat-flamingo cat-green cat-macchiato cat-maroon cat-mauve cat-peach cat-pink cat-red cat-rosewater cat-sapphire cat-sky cat-teal cat-yellow dracula-cyan dracula-green dracula-orange dracula-pink dracula-purple dracula-red dracula-teddy dracula-yellow gruvbox-aqua gruvbox-black gruvbox-blue gruvbox-gray gruvbox-green gruvbox-mojas84 gruvbox-orange gruvbox-purple gruvbox-white x1 x1_25 x1_5 x2

cp -r svg joris; cp -r svg joris2; cp -r svg joris3; cp -r dark joris4
cp -r svg blue; cp -r svg purple
cp -r svg cat-blue; cp -r svg cat-flamingo; cp -r svg cat-green; cp -r dark cat-macchiato; cp -r svg cat-maroon; cp -r svg cat-mauve; cp -r svg cat-peach; cp -r svg cat-pink; cp -r svg cat-red; cp -r svg cat-rosewater; cp -r svg cat-sapphire; cp -r svg cat-sky; cp -r svg cat-teal; cp -r svg cat-yellow
cp -r dark dracula-cyan ; cp -r dark dracula-green ; cp -r dark dracula-orange ; cp -r dark dracula-pink ; cp -r dark dracula-purple ; cp -r dark dracula-red; cp -r dark dracula-teddy ; cp -r dark dracula-yellow
cp -r svg gruvbox-aqua;  cp -r dark gruvbox-black; cp -r svg gruvbox-blue; cp -r svg gruvbox-gray;  cp -r svg gruvbox-green; cp -r svg gruvbox-mojas84;  cp -r svg gruvbox-orange;  cp -r svg gruvbox-purple;  cp -r svg gruvbox-white

# Main Color, Stroke, Accents, Context Menu (Help/Copy/Question), Loading BG, Loading FG, Context BG, Loading on Cursor.
cd "$SRC"/joris && sed -i "s/#111111/#D699b6/g" `ls` && sed -i "s/#222222/#2d353b/g" `ls` && sed -i "s/#333333/#e6c2d3/g" `ls` && sed -i "s/#444444/#2d353b/g" `ls` && sed -i "s/#555555/#2d353b/g" `ls` && sed -i "s/#666666/#D699b6/g" `ls` && sed -i "s/#777777/#e6c2d3/g" `ls` && sed -i "s/#888888/#2d353b/g" `ls`

cd "$SRC"/joris2 && sed -i "s/#111111/#05D2AE/g" `ls` && sed -i "s/#222222/#012a23/g" `ls` && sed -i "s/#333333/#69E4CE/g" `ls` && sed -i "s/#444444/#012a23/g" `ls` && sed -i "s/#555555/#012a23/g" `ls` && sed -i "s/#666666/#05D2AE/g" `ls` && sed -i "s/#777777/#69E4CE/g" `ls` && sed -i "s/#888888/#012a23/g" `ls`

cd "$SRC"/joris3 && sed -i "s/#111111/#D3C6AA/g" `ls` && sed -i "s/#222222/#4F585E/g" `ls` && sed -i "s/#333333/#e5ddcc/g" `ls` && sed -i "s/#444444/#4F585E/g" `ls` && sed -i "s/#555555/#4F585E/g" `ls` && sed -i "s/#666666/#D3C6AA/g" `ls` && sed -i "s/#777777/#e5ddcc/g" `ls` && sed -i "s/#888888/#4F585E/g" `ls`

cd "$SRC"/joris4 && sed -i "s/#111111/#2D353B/g" `ls` && sed -i "s/#222222/#D699B6/g" `ls` && sed -i "s/#333333/#e6c2d3/g" `ls` && sed -i "s/#444444/#2D353B/g" `ls` && sed -i "s/#555555/#2D353B/g" `ls` && sed -i "s/#666666/#D699B6/g" `ls` && sed -i "s/#777777/#e6c2d3/g" `ls` && sed -i "s/#888888/#D699B6/g" `ls`

cd "$SRC"/blue && sed -i "s/#111111/#7786ec/g" `ls` && sed -i "s/#222222/#181b2f/g" `ls` && sed -i "s/#333333/#adb6f4/g" `ls` && sed -i "s/#444444/#181b2f/g" `ls` && sed -i "s/#555555/#181b2f/g" `ls` && sed -i "s/#666666/#7786ec/g" `ls` && sed -i "s/#777777/#adb6f4/g" `ls` && sed -i "s/#888888/#181b2f/g" `ls`

cd "$SRC"/purple && sed -i "s/#111111/#8a80e0/g" `ls` && sed -i "s/#222222/#1c1a2d/g" `ls` && sed -i "s/#333333/#c1bbfe/g" `ls` && sed -i "s/#444444/#1c1a2d/g" `ls` && sed -i "s/#555555/#1c1a2d/g" `ls` && sed -i "s/#666666/#8a80e0/g" `ls` && sed -i "s/#777777/#c1bbfe/g" `ls` && sed -i "s/#888888/#1c1a2d/g" `ls`

cd "$SRC"/cat-blue && sed -i "s/#111111/#89B4FA/g" `ls` && sed -i "s/#222222/#1b2432/g" `ls` && sed -i "s/#333333/#b8d2fc/g" `ls` && sed -i "s/#444444/#1b2432/g" `ls` && sed -i "s/#555555/#1b2432/g" `ls` && sed -i "s/#666666/#89B4FA/g" `ls` && sed -i "s/#777777/#b8d2fc/g" `ls` && sed -i "s/#888888/#1b2432/g" `ls`

cd "$SRC"/cat-flamingo && sed -i "s/#111111/#F2CDCD/g" `ls` && sed -i "s/#222222/#302929/g" `ls` && sed -i "s/#333333/#f7e1e1/g" `ls` && sed -i "s/#444444/#302929/g" `ls` && sed -i "s/#555555/#302929/g" `ls` && sed -i "s/#666666/#F2CDCD/g" `ls` && sed -i "s/#777777/#f7e1e1/g" `ls` && sed -i "s/#888888/#302929/g" `ls`

cd "$SRC"/cat-green && sed -i "s/#111111/#A6E3A1/g" `ls` && sed -i "s/#222222/#212d20/g" `ls` && sed -i "s/#333333/#caeec7/g" `ls` && sed -i "s/#444444/#212d20/g" `ls` && sed -i "s/#555555/#212d20/g" `ls` && sed -i "s/#666666/#A6E3A1/g" `ls` && sed -i "s/#777777/#caeec7/g" `ls` && sed -i "s/#888888/#212d20/g" `ls`

cd "$SRC"/cat-macchiato && sed -i "s/#111111/#24273A/g" `ls` && sed -i "s/#222222/#EFF1F5/g" `ls` && sed -i "s/#333333/#7c7d89/g" `ls` && sed -i "s/#444444/#24273A/g" `ls` && sed -i "s/#555555/#24273A/g" `ls` && sed -i "s/#666666/#EFF1F5/g" `ls` && sed -i "s/#777777/#EFF1F5/g" `ls` && sed -i "s/#888888/#EFF1F5/g" `ls`

cd "$SRC"/cat-maroon && sed -i "s/#111111/#EBA0AC/g" `ls` && sed -i "s/#222222/#2f2022/g" `ls` && sed -i "s/#333333/#f3c6cd/g" `ls` && sed -i "s/#444444/#2f2022/g" `ls` && sed -i "s/#555555/#2f2022/g" `ls` && sed -i "s/#666666/#EBA0AC/g" `ls` && sed -i "s/#777777/#f3c6cd/g" `ls` && sed -i "s/#888888/#2f2022/g" `ls`

cd "$SRC"/cat-mauve && sed -i "s/#111111/#cba6f7/g" `ls` && sed -i "s/#222222/#292131/g" `ls` && sed -i "s/#333333/#e0cafa/g" `ls` && sed -i "s/#444444/#292131/g" `ls` && sed -i "s/#555555/#292131/g" `ls` && sed -i "s/#666666/#cba6f7/g" `ls` && sed -i "s/#777777/#e0cafa/g" `ls` && sed -i "s/#888888/#292131/g" `ls`

cd "$SRC"/cat-peach && sed -i "s/#111111/#FAB387/g" `ls` && sed -i "s/#222222/#32241b/g" `ls` && sed -i "s/#333333/#fcd1b7/g" `ls` && sed -i "s/#444444/#32241b/g" `ls` && sed -i "s/#555555/#32241b/g" `ls` && sed -i "s/#666666/#FAB387/g" `ls` && sed -i "s/#777777/#fcd1b7/g" `ls` && sed -i "s/#888888/#32241b/g" `ls`

cd "$SRC"/cat-pink && sed -i "s/#111111/#F5C2E7/g" `ls` && sed -i "s/#222222/#31272e/g" `ls` && sed -i "s/#333333/#f9daf1/g" `ls` && sed -i "s/#444444/#31272e/g" `ls` && sed -i "s/#555555/#31272e/g" `ls` && sed -i "s/#666666/#F5C2E7/g" `ls` && sed -i "s/#777777/#f9daf1/g" `ls` && sed -i "s/#888888/#31272e/g" `ls`

cd "$SRC"/cat-red && sed -i "s/#111111/#F38BA8/g" `ls` && sed -i "s/#222222/#311c22/g" `ls` && sed -i "s/#333333/#f8b9cb/g" `ls` && sed -i "s/#444444/#311c22/g" `ls` && sed -i "s/#555555/#311c22/g" `ls` && sed -i "s/#666666/#F38BA8/g" `ls` && sed -i "s/#777777/#f8b9cb/g" `ls` && sed -i "s/#888888/#311c22/g" `ls`

cd "$SRC"/cat-rosewater && sed -i "s/#111111/#f5e0dc/g" `ls` && sed -i "s/#222222/#322529/g" `ls` && sed -i "s/#333333/#f9ecea/g" `ls` && sed -i "s/#444444/#322529/g" `ls` && sed -i "s/#555555/#322529/g" `ls` && sed -i "s/#666666/#f5e0dc/g" `ls` && sed -i "s/#777777/#f9ecea/g" `ls` && sed -i "s/#888888/#322529/g" `ls`

cd "$SRC"/cat-sapphire && sed -i "s/#111111/#73C6EB/g" `ls` && sed -i "s/#222222/#17282f/g" `ls` && sed -i "s/#333333/#abddf3/g" `ls` && sed -i "s/#444444/#17282f/g" `ls` && sed -i "s/#555555/#17282f/g" `ls` && sed -i "s/#666666/#73C6EB/g" `ls` && sed -i "s/#777777/#abddf3/g" `ls` && sed -i "s/#888888/#17282f/g" `ls`

cd "$SRC"/cat-sky && sed -i "s/#111111/#89DCEB/g" `ls` && sed -i "s/#222222/#1b2c2f/g" `ls` && sed -i "s/#333333/#b8eaf3/g" `ls` && sed -i "s/#444444/#1b2c2f/g" `ls` && sed -i "s/#555555/#1b2c2f/g" `ls` && sed -i "s/#666666/#89DCEB/g" `ls` && sed -i "s/#777777/#b8eaf3/g" `ls` && sed -i "s/#888888/#1b2c2f/g" `ls`

cd "$SRC"/cat-teal && sed -i "s/#111111/#94E2D5/g" `ls` && sed -i "s/#222222/#1e2d2b/g" `ls` && sed -i "s/#333333/#bfeee6/g" `ls` && sed -i "s/#444444/#1e2d2b/g" `ls` && sed -i "s/#555555/#1e2d2b/g" `ls` && sed -i "s/#666666/#94E2D5/g" `ls` && sed -i "s/#777777/#bfeee6/g" `ls` && sed -i "s/#888888/#1e2d2b/g" `ls`

cd "$SRC"/cat-yellow && sed -i "s/#111111/#F9E2AF/g" `ls` && sed -i "s/#222222/#322d23/g" `ls` && sed -i "s/#333333/#fbeecf/g" `ls` && sed -i "s/#444444/#322d23/g" `ls` && sed -i "s/#555555/#322d23/g" `ls` && sed -i "s/#666666/#F9E2AF/g" `ls` && sed -i "s/#777777/#fbeecf/g" `ls` && sed -i "s/#888888/#322d23/g" `ls`

cd "$SRC"/dracula-cyan && sed -i "s/#111111/#282A36/g" `ls` && sed -i "s/#222222/#8be9fd/g" `ls` && sed -i "s/#333333/#6fbaca/g" `ls` && sed -i "s/#444444/#282A36/g" `ls` && sed -i "s/#555555/#282A36/g" `ls` && sed -i "s/#666666/#8be9fd/g" `ls` && sed -i "s/#777777/#8be9fd/g" `ls` && sed -i "s/#888888/#8be9fd/g" `ls`

cd "$SRC"/dracula-green && sed -i "s/#111111/#282A36/g" `ls` && sed -i "s/#222222/#50fa7b/g" `ls` && sed -i "s/#333333/#40c862/g" `ls` && sed -i "s/#444444/#282A36/g" `ls` && sed -i "s/#555555/#282A36/g" `ls` && sed -i "s/#666666/#50fa7b/g" `ls` && sed -i "s/#777777/#50fa7b/g" `ls` && sed -i "s/#888888/#50fa7b/g" `ls`

cd "$SRC"/dracula-orange && sed -i "s/#111111/#282A36/g" `ls` && sed -i "s/#222222/#ffb86c/g" `ls` && sed -i "s/#333333/#cc9356/g" `ls` && sed -i "s/#444444/#282A36/g" `ls` && sed -i "s/#555555/#282A36/g" `ls` && sed -i "s/#666666/#ffb86c/g" `ls` && sed -i "s/#777777/#ffb86c/g" `ls` && sed -i "s/#888888/#ffb86c/g" `ls`

cd "$SRC"/dracula-pink && sed -i "s/#111111/#282A36/g" `ls` && sed -i "s/#222222/#ff79c6/g" `ls` && sed -i "s/#333333/#cc619e/g" `ls` && sed -i "s/#444444/#282A36/g" `ls` && sed -i "s/#555555/#282A36/g" `ls` && sed -i "s/#666666/#ff79c6/g" `ls` && sed -i "s/#777777/#ff79c6/g" `ls` && sed -i "s/#888888/#ff79c6/g" `ls`

cd "$SRC"/dracula-purple && sed -i "s/#111111/#282A36/g" `ls` && sed -i "s/#222222/#bd93f9/g" `ls` && sed -i "s/#333333/#9776c7/g" `ls` && sed -i "s/#444444/#282A36/g" `ls` && sed -i "s/#555555/#282A36/g" `ls` && sed -i "s/#666666/#bd93f9/g" `ls` && sed -i "s/#777777/#bd93f9/g" `ls` && sed -i "s/#888888/#bd93f9/g" `ls`

cd "$SRC"/dracula-red && sed -i "s/#111111/#282A36/g" `ls` && sed -i "s/#222222/#ff5555/g" `ls` && sed -i "s/#333333/#cc4444/g" `ls` && sed -i "s/#444444/#282A36/g" `ls` && sed -i "s/#555555/#282A36/g" `ls` && sed -i "s/#666666/#ff5555/g" `ls` && sed -i "s/#777777/#ff5555/g" `ls` && sed -i "s/#888888/#ff5555/g" `ls`

cd "$SRC"/dracula-teddy && sed -i "s/#111111/#282A36/g" `ls` && sed -i "s/#222222/#988dfd/g" `ls` && sed -i "s/#333333/#7a71ca/g" `ls` && sed -i "s/#444444/#282A36/g" `ls` && sed -i "s/#555555/#282A36/g" `ls` && sed -i "s/#666666/#988dfd/g" `ls` && sed -i "s/#777777/#988dfd/g" `ls` && sed -i "s/#888888/#988dfd/g" `ls`

cd "$SRC"/dracula-yellow && sed -i "s/#111111/#282A36/g" `ls` && sed -i "s/#222222/#f1fa8c/g" `ls` && sed -i "s/#333333/#c1c870/g" `ls` && sed -i "s/#444444/#282A36/g" `ls` && sed -i "s/#555555/#282A36/g" `ls` && sed -i "s/#666666/#f1fa8c/g" `ls` && sed -i "s/#777777/#f1fa8c/g" `ls` && sed -i "s/#888888/#f1fa8c/g" `ls`

cd "$SRC"/gruvbox-aqua && sed -i "s/#111111/#8ec07c/g" `ls` && sed -i "s/#222222/#1c2619/g" `ls` && sed -i "s/#333333/#bbd9b0/g" `ls` && sed -i "s/#444444/#1c2619/g" `ls` && sed -i "s/#555555/#1c2619/g" `ls` && sed -i "s/#666666/#8ec07c/g" `ls` && sed -i "s/#777777/#bbd9b0/g" `ls` && sed -i "s/#888888/#1c2619/g" `ls`

cd "$SRC"/gruvbox-black && sed -i "s/#111111/#282828/g" `ls` && sed -i "s/#222222/#ebdbb2/g" `ls` && sed -i "s/#333333/#7e7e7e/g" `ls` && sed -i "s/#444444/#282828/g" `ls` && sed -i "s/#555555/#181818/g" `ls` && sed -i "s/#666666/#ebdbb2/g" `ls` && sed -i "s/#777777/#ebdbb2/g" `ls` && sed -i "s/#888888/#ebdbb2/g" `ls`

cd "$SRC"/gruvbox-blue && sed -i "s/#111111/#83a598/g" `ls` && sed -i "s/#222222/#1a211e/g" `ls` && sed -i "s/#333333/#b5c9c1/g" `ls` && sed -i "s/#444444/#1a211e/g" `ls` && sed -i "s/#555555/#1a211e/g" `ls` && sed -i "s/#666666/#83a598/g" `ls` && sed -i "s/#777777/#b5c9c1/g" `ls` && sed -i "s/#888888/#1a211e/g" `ls`

cd "$SRC"/gruvbox-gray && sed -i "s/#111111/#928374/g" `ls` && sed -i "s/#222222/#1d1a17/g" `ls` && sed -i "s/#333333/#beb5ac/g" `ls` && sed -i "s/#444444/#1d1a17/g" `ls` && sed -i "s/#555555/#1d1a17/g" `ls` && sed -i "s/#666666/#928374/g" `ls` && sed -i "s/#777777/#beb5ac/g" `ls` && sed -i "s/#888888/#1d1a17/g" `ls`

cd "$SRC"/gruvbox-green && sed -i "s/#111111/#b8bb26/g" `ls` && sed -i "s/#222222/#252508/g" `ls` && sed -i "s/#333333/#d4d67d/g" `ls` && sed -i "s/#444444/#252508/g" `ls` && sed -i "s/#555555/#252508/g" `ls` && sed -i "s/#666666/#b8bb26/g" `ls` && sed -i "s/#777777/#d4d67d/g" `ls` && sed -i "s/#888888/#252508/g" `ls`

cd "$SRC"/gruvbox-mojas84 && sed -i "s/#111111/#B16286/g" `ls` && sed -i "s/#222222/#23141b/g" `ls` && sed -i "s/#333333/#d0a1b6/g" `ls` && sed -i "s/#444444/#23141b/g" `ls` && sed -i "s/#555555/#23141b/g" `ls` && sed -i "s/#666666/#B16286/g" `ls` && sed -i "s/#777777/#d0a1b6/g" `ls` && sed -i "s/#888888/#23141b/g" `ls`

cd "$SRC"/gruvbox-orange && sed -i "s/#111111/#fe8019/g" `ls` && sed -i "s/#222222/#331a05/g" `ls` && sed -i "s/#333333/#feb375/g" `ls` && sed -i "s/#444444/#331a05/g" `ls` && sed -i "s/#555555/#331a05/g" `ls` && sed -i "s/#666666/#fe8019/g" `ls` && sed -i "s/#777777/#feb375/g" `ls` && sed -i "s/#888888/#331a05/g" `ls`

cd "$SRC"/gruvbox-purple && sed -i "s/#111111/#d3869b/g" `ls` && sed -i "s/#222222/#2a1b1f/g" `ls` && sed -i "s/#333333/#e5b6c3/g" `ls` && sed -i "s/#444444/#2a1b1f/g" `ls` && sed -i "s/#555555/#2a1b1f/g" `ls` && sed -i "s/#666666/#d3869b/g" `ls` && sed -i "s/#777777/#e5b6c3/g" `ls` && sed -i "s/#888888/#2a1b1f/g" `ls`

cd "$SRC"/gruvbox-white && sed -i "s/#111111/#ebdbb2/g" `ls` && sed -i "s/#222222/#2f2c24/g" `ls` && sed -i "s/#333333/#f3e9d1/g" `ls` && sed -i "s/#444444/#2f2c24/g" `ls` && sed -i "s/#555555/#2f2c24/g" `ls` && sed -i "s/#666666/#ebdbb2/g" `ls` && sed -i "s/#777777/#f3e9d1/g" `ls` && sed -i "s/#888888/#2f2c24/g" `ls`
# Main Color, Stroke, Accents, Context Menu (Help/Copy/Question), Loading BG, Loading FG, Context BG, Loading on Cursor.

THEME="Graphite Joris"
BUILD="$SRC/../dist/dist-joris"
create joris
echo Graphite Joris Done...

THEME="Graphite Joris 2"
BUILD="$SRC/../dist/dist-joris2"
create joris2
echo Graphite Joris 2 Done...

THEME="Graphite Joris 3"
BUILD="$SRC/../dist/dist-joris3"
create joris3
echo Graphite Joris 3 Done...

THEME="Graphite Joris 4"
BUILD="$SRC/../dist/dist-joris4"
create joris4
echo Graphite Joris 4 Done...

THEME="Graphite Blue"
BUILD="$SRC/../dist/dist-blue"
create blue
echo Graphite Blue Done...

THEME="Graphite Purple"
BUILD="$SRC/../dist/dist-purple"
create purple
echo Graphite Purple Done...

THEME="Graphite Catppuccin Blue"
BUILD="$SRC/../dist/dist-cat-blue"
create cat-blue
echo Graphite Catppuccin Blue Done...

THEME="Graphite Catppuccin Flamingo"
BUILD="$SRC/../dist/dist-cat-flamingo"
create cat-flamingo
echo Graphite Catppuccin Flamingo Done...

THEME="Graphite Catppuccin Green"
BUILD="$SRC/../dist/dist-cat-green"
create cat-green
echo Graphite Catppuccin Green Done...

THEME="Graphite Catppuccin Macchiato"
BUILD="$SRC/../dist/dist-cat-macchiato"
create cat-macchiato
echo Graphite Catppuccin Macchiato Done...

THEME="Graphite Catppuccin Maroon"
BUILD="$SRC/../dist/dist-cat-maroon"
create cat-maroon
echo Graphite Catppuccin Maroon Done...

THEME="Graphite Catppuccin Mauve"
BUILD="$SRC/../dist/dist-cat-mauve"
create cat-mauve
echo Graphite Catppuccin Mauve Done...

THEME="Graphite Catppuccin Peach"
BUILD="$SRC/../dist/dist-cat-peach"
create cat-peach
echo Graphite Catppuccin Peach Done...

THEME="Graphite Catppuccin Pink"
BUILD="$SRC/../dist/dist-cat-pink"
create cat-pink
echo Graphite Catppuccin Pink Done...

THEME="Graphite Catppuccin Red"
BUILD="$SRC/../dist/dist-cat-red"
create cat-red
echo Graphite Catppuccin Red Done...

THEME="Graphite Catppuccin Rosewater"
BUILD="$SRC/../dist/dist-cat-rosewater"
create cat-rosewater
echo Graphite Catppuccin Rosewater Done...

THEME="Graphite Catppuccin Sapphire"
BUILD="$SRC/../dist/dist-cat-sapphire"
create cat-sapphire
echo Graphite Catppuccin Sapphire Done...

THEME="Graphite Catppuccin Sky"
BUILD="$SRC/../dist/dist-cat-sky"
create cat-sky
echo Graphite Catppuccin Sky Done...

THEME="Graphite Catppuccin Teal"
BUILD="$SRC/../dist/dist-cat-teal"
create cat-teal
echo Graphite Catppuccin Teal Done...

THEME="Graphite Catppuccin Yellow"
BUILD="$SRC/../dist/dist-cat-yellow"
create cat-yellow
echo Graphite Catppuccin Yellow Done...

THEME="Graphite Dracula Cyan"
BUILD="$SRC/../dist/dist-dracula-cyan"
create dracula-cyan
echo Graphite Dracula Cyan Done...

THEME="Graphite Dracula Green"
BUILD="$SRC/../dist/dist-dracula-green"
create dracula-green
echo Graphite Dracula Green Done...

THEME="Graphite Dracula Orange"
BUILD="$SRC/../dist/dist-dracula-orange"
create dracula-orange
echo Graphite Dracula Orange Done...

THEME="Graphite Dracula Pink"
BUILD="$SRC/../dist/dist-dracula-pink"
create dracula-pink
echo Graphite Dracula Pink Done...

THEME="Graphite Dracula Purple"
BUILD="$SRC/../dist/dist-dracula-purple"
create dracula-purple
echo Graphite Dracula Purple Done...

THEME="Graphite Dracula Red"
BUILD="$SRC/../dist/dist-dracula-red"
create dracula-red
echo Graphite Dracula Red Done...

THEME="Graphite Dracula Teddy"
BUILD="$SRC/../dist/dist-dracula-teddy"
create dracula-teddy
echo Graphite Dracula Teddy Done...

THEME="Graphite Dracula Yellow"
BUILD="$SRC/../dist/dist-dracula-yellow"
create dracula-yellow
echo Graphite Dracula Yellow Done...

THEME="Graphite Gruvbox Aqua"
BUILD="$SRC/../dist/dist-gruvbox-aqua"
create gruvbox-aqua
echo Graphite Gruvbox Aqua Done...

THEME="Graphite Gruvbox Black"
BUILD="$SRC/../dist/dist-gruvbox-black"
create gruvbox-black
echo Graphite Gruvbox Black Done...

THEME="Graphite Gruvbox Blue"
BUILD="$SRC/../dist/dist-gruvbox-blue"
create gruvbox-blue
echo Graphite Gruvbox Blue Done...

THEME="Graphite Gruvbox Gray"
BUILD="$SRC/../dist/dist-gruvbox-gray"
create gruvbox-gray
echo Graphite Gruvbox Gray Done...

THEME="Graphite Gruvbox Green"
BUILD="$SRC/../dist/dist-gruvbox-green"
create gruvbox-green
echo Graphite Gruvbox Green Done...

THEME="Graphite Gruvbox Mojas84"
BUILD="$SRC/../dist/dist-gruvbox-mojas84"
create gruvbox-mojas84
echo Graphite Gruvbox Mojas84 Done...

THEME="Graphite Gruvbox Orange"
BUILD="$SRC/../dist/dist-gruvbox-orange"
create gruvbox-orange
echo Graphite Gruvbox Orange Done...

THEME="Graphite Gruvbox Purple"
BUILD="$SRC/../dist/dist-gruvbox-purple"
create gruvbox-purple
echo Graphite Gruvbox Purple Done...

THEME="Graphite Gruvbox White"
BUILD="$SRC/../dist/dist-gruvbox-white"
create gruvbox-white
echo Graphite Gruvbox White Done...

cd "$SRC"; rm -rf joris joris2 joris3 joris4 blue purple cat-blue cat-flamingo cat-green cat-macchiato cat-maroon cat-mauve cat-peach cat-pink cat-red cat-rosewater cat-sapphire cat-sky cat-teal cat-yellow dracula-cyan dracula-green dracula-orange dracula-pink dracula-purple dracula-red dracula-teddy dracula-yellow gruvbox-aqua gruvbox-black gruvbox-blue gruvbox-gray gruvbox-green gruvbox-mojas84 gruvbox-orange gruvbox-purple gruvbox-white x1 x1_25 x1_5 x2
echo All cursors exported to the dist/ directory!
