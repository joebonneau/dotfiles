#!/usr/bin/env bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Spotify TUI
# @raycast.mode silent

# Optional parameters:
# @raycast.icon 🤖
# @raycast.packageName sesh

# Documentation:
# @raycast.description Open spotify_player tmux session
# @raycast.author joe_bonneau
# @raycast.authorURL https://raycast.com/joe_bonneau

sesh connect --switch "spotify"
open -a "Alacritty"
