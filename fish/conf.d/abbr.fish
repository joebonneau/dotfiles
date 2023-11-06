abbr g git
abbr gst "git status"
abbr gc "git commit --no-verify -m"
abbr ga "git add"
abbr gp "git push"
abbr gcb "git checkout -b"
abbr gfl "git fetch && git pull"

abbr dcb "docker-compose build"
abbr dcd "docker-compose down"
abbr dcr "docker-compose run --rm"
abbr dcu "docker-compose up"
abbr dcud "docker-compose up -d"
abbr dps "docker ps"

abbr c clear
abbr ef "source ~/git_repos/dotfiles/fish/conf.d/abbr.fish && exec fish"

# dev-scripts
abbr update-devscripts "docker pull git.amyris.local:4567/amyris/dev-scripts:latest"
abbr devscripts "docker run --volume=$pwd:/app -e GIT_DISCOVERY_ACROSS_FILESYSTEM=1 -it --rm git.amyris.local:4567/amyris/dev-scripts:latest"
abbr metadata "devscripts metadata"
abbr aformat "devscripts aformat"
abbr adr "devscripts adr"
abbr dev-devscripts "docker run --volume=$pwd:/app --user "(id -u):(id -g)" -it --rm dev-scripts_app:latest"
abbr dev-aformat "dev-devscripts aformat"
abbr dev-adr "dev-devscripts adr"

# my scripts
abbr ts tmux-split
