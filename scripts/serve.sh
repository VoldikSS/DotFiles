#! /usr/bin/env bash

# Starts a Python server, with optional port argument
#
# Params:
#     port - Optional port to serve at (defaults to 8080)
#
# Usage: server [port]
#
function serve() {
  python -m http.server "${1:-8080}"
}

serve $@
