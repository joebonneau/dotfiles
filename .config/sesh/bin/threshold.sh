#! /usr/bin/env bash

tmux new-window -n "servers"
tmux send-keys "cd frontend && npm run dev" Enter
tmux split-window
tmux send-keys "cd pdp && pyenv activate pdp && flask run --debug --host=0.0.0.0" Enter
tmux new-window
tmux send-keys "nvim" Enter
