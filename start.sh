#!/usr/bin/env bash

# Stop immediately if a command fails, a variable is missing, or a pipeline fails.
set -euo pipefail

# Resolve the directory containing this script so it works from any current directory.
script_dir="$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)"

# This automatic installer currently targets Debian and Ubuntu systems.
if ! command -v apt-get >/dev/null 2>&1; then
    echo "This launcher supports Debian/Ubuntu systems with apt-get." >&2
    exit 1
fi

# "wish" is the Tcl/Tk interpreter. Install it only when it is missing.
if ! command -v wish >/dev/null 2>&1; then
    echo "Tcl/Tk is not installed. Installing it now..."
    sudo apt-get update
    sudo apt-get install -y tk
fi

# Replace this shell process with the GUI application.
exec wish "$script_dir/duck.tcl"

