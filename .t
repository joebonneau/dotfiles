#!/usr/bin/env bash
# one window for nvim, one for shell
tmux new-window
tmux new-window
tmux send-keys 'nvim' Enter
session_name=$(tmux display-message -p "#S")
tmux switch-client -t "$session_name:nvim"
