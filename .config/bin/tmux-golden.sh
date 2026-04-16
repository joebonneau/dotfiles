#!/usr/bin/env bash
window=$(tmux display-message -p '#{window_id}')
if ! tmux list-panes -t "$window" -F '#{pane_current_command}' | grep -qiE '^n?vim$'; then
  exit 0
fi
PHI=1.618
pane=$(tmux display-message -p '#{pane_id}')
width=$(tmux display-message -p '#{window_width}')
height=$(tmux display-message -p '#{window_height}')
tw=$(awk -v w="$width" -v p="$PHI" 'BEGIN{printf "%d", w/p}')
th=$(awk -v h="$height" -v p="$PHI" 'BEGIN{printf "%d", h/p}')
tmux resize-pane -t "$pane" -x "$tw" -y "$th" 2>/dev/null
exit 0
