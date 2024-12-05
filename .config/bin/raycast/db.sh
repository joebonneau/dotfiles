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

aerospace workspace --fail-if-noop A 2>/dev/null
# check if already on terminal workspace
if [[ $? == 1 ]]; then
  active_session="$(sesh list | head -n 1)"
  if [[ "$active_session" != "db" ]]; then
    # switch to the db session if not currently on it
    sesh connect --switch db
    exit 0
  else
    aerospace workspace-back-and-forth
  fi
else
  sesh connect --switch db
fi
