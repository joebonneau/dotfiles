#!/usr/bin/env bash

tmux new-window -n "fish"
tmux new-window -n "nvim"
tmux switch-client -t "nvim"
tmux send-keys 'nvim -c "Telescope find_files"' 'Enter'
