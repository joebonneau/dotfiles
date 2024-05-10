#! /usr/bin/env bash

tmux new-window -n "devserver"

tmux send-keys "python ./recipester/manage.py runserver" Enter

tmux split-window
tmux send-keys "cd recipester && npx tailwindcss -i ./recipester/static/src/input.css -o ./recipester/static/src/output.css --watch" Enter

tmux new-window
tmux send-keys "nvim" Enter
