#!/usr/bin/env bash

# -- Author: @servernoj

# paths to binaries
ffmpeg=/usr/local/bin/ffmpeg
ffprobe=$(dirname $ffmpeg)/ffprobe
montage=/usr/local/bin/montage
awk=/usr/bin/awk

# variables
width=${2:-4}
height=${3:-3}
dir=$(dirname "$1")

# action
mkdir "$$"
spf=$(eval "$ffprobe -loglevel error -show_streams \"$1\" | $awk -F= '/duration[^_]/{printf \"%d\n\", \$2/($width*$height)}'")
length=$((spf*width*height))
eval $ffmpeg -hide_banner -loglevel error -i "$1" -to $length -r 1/$spf "$$/thumb_%05d.jpg"
eval $montage "$$/thumb_*" -tile ${width}x -geometry x1080+5+5 "$1.jpg"

# clean up
rm -rf "$$"
