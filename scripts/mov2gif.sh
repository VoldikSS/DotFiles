#! /usr/bin/env bash

# Converts Quicktime screen recording to a gif
#
# Params:
#     infile - input file (.mov)
#     outfile - output filename (.gif)
#
# Usage: mov2gif infile outfile
#
function mov2gif() {
  usage="usage: mov2gif input.mov output.gif"

  if [ -z "$1" ] || [ -z "$2" ]; then
    echo "$usage"
    return 1
  elif command -v ffmpeg &> /dev/null && command -v gifsicle &> /dev/null; then
    infile="$1"
    outfile="$2"

    if [ -f "$infile" ]; then
      ffmpeg -hide_banner -loglevel quiet -i "$infile" -s 600x400 -pix_fmt rgb24 -r 10 -f gif - | gifsicle --optimize=3 --delay=3 > "$outfile"

      echo "${infile} converted and saved to ${outfile}"
    else
      echo "fatal: ${infile} is not a file"
      return 1
    fi
  else
    echo "fatal: ffmpeg and gifsicle are not installed"
    return 1
  fi
}

mov2gif $@
