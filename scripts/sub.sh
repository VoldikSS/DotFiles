#! /usr/bin/env bash

# Recursively find and replace text within files in a directory
#
# Params:
#    old: Text to search for
#    new: Replacement text
#
# Usage: sub old new
function sub() {
  usage="usage: sub old new"

  if [ -z "$1" ] || [ -z "$2" ]; then
    echo "$usage"
    return 1
  fi

  if command -v rg &> /dev/null; then
    rg "$1" --files-with-matches * | xargs -r sed -i "s/$1/$2/g"
  else
    echo "fatal: ripgrep must be installed"
    return 1
  fi
}

sub $@
