#!/usr/bin/env bash
selected=$(cat ~/.config/tmux/.tmux-cht-languages ~/.config/tmux/.tmux-cht-commands | fzf)
if [[ -z $selected ]]; then
	exit 0
fi

read -p "Enter Query: " query

if grep -qs "$selected" ~/.config/tmux/.tmux-cht-languages; then
	query=$(echo $query | tr ' ' '+')
	tmux split-window -h bash -c "curl cht.sh/$selected/$query | bat"
	# tmux split-window bash -c "echo \"curl cht.sh/$selected/$query/\" & curl cht.sh/$selected/$query | bat"
	# tmux neww bash -c "echo \"curl cht.sh/$selected/$query/\" & curl cht.sh/$selected/$query & while [ : ]; do sleep 1; done"
else
	tmux new-window bash -c "curl -s cht.sh/$selected~$query | bat"
fi
