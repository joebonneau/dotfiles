set BGreen '\033[1;32m'
set NC '\033[0m' # No Color

function tmux-source
    set -l filenames "~/git_repos/dotfiles/fish/config.fish" "~/git_repos/dotfiles/fish/conf.d/abbr.fish" "~/git_repos/dotfiles/fish/conf.d/abbr.fish"
    for filename in $filenames
        set escaped_filename (echo $filename | sed 's/\./\\./g')
        set quoted_filename "'$escaped_filename'"
        tmux list-sessions -F '#{session_name}' \
            | xargs -I{} tmux list-windows -t {} -F '#{window_id}' \
            | xargs -I{} tmux list-panes -t {} -F '#{pane_id}' \
            | xargs -I{} tmux send-keys -t {} "source $quoted_filename" Enter
    end
end

function dsh
    set containers (docker ps --format "{{.Names}}")
    set container_name (printf "%s\n" $containers | fzf-tmux -p --border-label=" Select a container ")

    if [ -z "$container_name" ]
        return
    else
        set container_id (docker ps --filter "name=$container_name" --format "{{.ID}}")
        echo -e "===== Entering container "$BGreen""$container_name""$NC" ====="
        docker exec -it "$container_id" /bin/bash
    end
end

function docker-refresh-openapi
    set webhash (docker ps | grep -m 1 "hermes_web" | awk '{print $1}')
    set webname (docker ps | grep -m 1 "hermes_web" | awk '{print $2}')
    set fehash (docker ps | grep -m 1 "hermes_frontend" | awk '{print $1}')
    set fename (docker ps | grep -m 1 "hermes_frontend" | awk '{print $2}')
    # read webhash webname <<< (docker ps | grep -m 1 "hermes_web" | awk '{print $1 " " $2}')
    # read fehash fename <<< (docker ps | grep -m 1 "hermes_frontend" | awk '{print $1 " " $2}')

    if [ -z "$webhash" ] && [ -z "$fehash" ]
        echo "*** The Hermes web and/or frontend container is not running!"
    else
        echo "===== Copying $1 to $fename ====="
        docker cp $1 $fehash:/app/hermes/public/__openapi__

        echo "===== Rebuilding the openapi.yml file and copying... ====="
        docker exec $fehash /bin/bash -c "npx @redocly/cli bundle /app/hermes/public/__openapi__/openapi.yml --output /app/hermes/public/openapi.yml --ext yml"

        echo "===== Copying the combined file to the $webname container... ====="
        docker cp $fehash:/app/hermes/public/openapi.yml combined_openapi.yml
        docker cp combined_openapi.yml $webhash:/app/hermes/public/openapi.yml
        rm combined_openapi.yml

        echo -e "===== Success! Restarting containers... ====="
        docker-compose restart web frontend app
    end
end

function gsw
    if [ (count $argv) -gt 0 ]
        set branch $argv[1]
    else
        set branch (git branch --format='%(refname:short)' | fzf-tmux -p --border-label=" Select a branch ")
    end
    if [ -n "$branch" ]
        git switch $branch
    end
end
