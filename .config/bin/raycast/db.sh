#!/usr/bin/env bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title DB session
# @raycast.mode silent

# Optional parameters:
# @raycast.icon 🤖
# @raycast.packageName sesh

# Documentation:
# @raycast.description Open db tmux session
# @raycast.author joe_bonneau
# @raycast.authorURL https://raycast.com/joe_bonneau

# FIXME: if already in Alacritty but not in the right session, switch to the session
# instead of switching workspaces
aerospace workspace --auto-back-and-forth A
sesh connect --switch db
