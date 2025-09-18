#!/bin/bash
# Usage: ./generate-qntro-icons.sh source.png
# Requires ImageMagick (sudo apt-get install imagemagick)

SRC_IMG="$1"
DEST_DIR="/home/codeambivert/Desktop/src_codes/qntro-fe/public/static/icons"

if [ -z "$SRC_IMG" ]; then
  echo "Usage: $0 source.png"
  exit 1
fi

sizes=(
  "48x48"
  "72x72"
  "96x96"
  "348x348"
  "512x512"
)

for size in "${sizes[@]}"; do
  convert "$SRC_IMG" -resize "$size" "$DEST_DIR/qntro-logo-$size.png"
done

# Special case for 1024x104 (force aspect ratio)
convert "$SRC_IMG" -resize 1024x104! "$DEST_DIR/qntro-logo-1024x104.png"

echo "All icons generated in $DEST_DIR"
