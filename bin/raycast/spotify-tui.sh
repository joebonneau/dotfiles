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

frontmostApp=$(osascript -e 'tell application "System Events" to get name of first application process whose frontmost is true')
if [ "$frontmostApp" = "alacritty" ]; then
	tmuxSession=$(tmux display -p "#S")
	if [ "$tmuxSession" = "spotify" ]; then
		osascript -e 'tell application "System Events" to keystroke "a" using {control down, option down}'
	else
		sesh connect --switch "spotify"
	fi
else
	sesh connect --switch "spotify"
	open -a "Alacritty"
fi
