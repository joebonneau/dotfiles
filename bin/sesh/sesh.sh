#! /usr/bin/env bash

tmux new-window
tmux send-keys "echo hello" Enter
session_name=$(tmux display-message -p "#S")
# tmux switch-client -t "$session_name:nvim"
