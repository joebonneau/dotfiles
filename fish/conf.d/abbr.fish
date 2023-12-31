# git
abbr g git
abbr gst "git status"
abbr gc "git commit --no-verify -m"
abbr ga "git add"
abbr gp "git push"
abbr gcb "git checkout -b"
abbr gfl "git fetch && git pull"
abbr gsw git-switch-branch

# docker
abbr dcb "docker-compose build"
abbr dcd "docker-compose down"
abbr dcr "docker-compose run --rm"
abbr dcu "docker-compose up"
abbr dcud "docker-compose up -d"
abbr dps "docker ps"
abbr dl docker-up-logs
abbr dr docker-restart-refresh-logs
abbr dsh docker-container-sh

# tmux
alias ts tmux-split

abbr nvim "nvim -c 'Telescope smart_open'"
abbr hfzf "history | fzf"

abbr c clear
abbr ef "source ~/git_repos/dotfiles/fish/conf.d/abbr.fish && exec fish"
abbr efa exec-all-sh

# dev-scripts
abbr update-devscripts "docker pull git.amyris.local:4567/amyris/dev-scripts:latest"
abbr devscripts "docker run --volume=$pwd:/app -e GIT_DISCOVERY_ACROSS_FILESYSTEM=1 -it --rm git.amyris.local:4567/amyris/dev-scripts:latest"
abbr metadata "devscripts metadata"
abbr aformat "devscripts aformat"
abbr adr "devscripts adr"
abbr dev-devscripts "docker run --volume=$pwd:/app --user "(id -u):(id -g)" -it --rm dev-scripts_app:latest"
abbr dev-aformat "dev-devscripts aformat"
abbr dev-adr "dev-devscripts adr"

# aliases for ease of use in neovim (abbr don't expand)
alias pydoc "python3 -m pydoc"
