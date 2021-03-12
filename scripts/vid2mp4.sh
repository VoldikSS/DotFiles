#! /usr/bin/env bash

# Converts a video file to mp4
#
# Params:
#     infile - input file
#
# Usage: vid2mp4 input
#
function vid2mp4() {
  usage="usage: vid2mp4 input"

  if [ -z "$1" ]; then
    echo "$usage"
    return 1
  elif command -v ffmpeg &> /dev/null; then
    filename="$(echo "$1" | cut -d . -f 1)"

    ffmpeg -i "$1" -c:v libx264 -crf 23 -c:a aac -q:a 100 "$filename.mp4"

    echo "$1 converted and saved to $2"
  else
    echo "fatal: ffmpeg is not installed"
  fi
}

vid2mp4 $@
