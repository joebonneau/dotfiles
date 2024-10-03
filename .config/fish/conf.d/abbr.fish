# git
abbr g git
abbr gst "git status"
abbr gsp "git stash push --"
abbr gc "git commit -m --trailer"
abbr gc git-commit-with-trailer
abbr gr "git rebase"
abbr gre "git rebase --exec 'source ~/git_repos/patient_data_platform/.githooks/pre-commit'"
abbr grei "git rebase -i --exec 'source ~/git_repos/patient_data_platform/.githooks/pre-commit' --reschedule-failed-exec"
abbr ga "git add"
abbr gp git-push-catch-temp
abbr gcb "git checkout -b"
abbr gfp "git push --force-with-lease --force-if-includes"
abbr gsw git-switch-branch

# docker
abbr dc "docker compose"
abbr dcl "docker compose logs --tail 50"
abbr dce "docker compose exec"
abbr dcb "docker compose build"
abbr dcd "docker compose down"
abbr dcr "docker compose run --rm"
abbr dcu "docker compose up"
abbr dcud "docker compose up -d"
abbr dps "docker ps"
abbr dl docker-up-logs
abbr dr docker-restart-refresh-logs
abbr dsh docker-container-sh
abbr ddi "docker rmi -f \$(docker images -aq)"

# tmux
alias ts tmux-split

# brew
abbr brewfile "brew bundle dump --force"

# abbr nvim "nvim -c \"Telescope smart_open\""
abbr hfzf "history | fzf"

abbr c clear
abbr ef "source ~/.config/fish/conf.d/abbr.fish && exec fish"
abbr efa exec-all-sh
abbr upda update-all

# aliases for ease of use in neovim (abbr don't expand)
alias pydoc "python3 -m pydoc"
