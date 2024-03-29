eval (/opt/homebrew/bin/brew shellenv)
# eval (/usr/local/bin/brew shellenv)
starship init fish | source
zoxide init fish | source
pyenv init - | source
status --is-interactive; and pyenv virtualenv-init - | source

set -U fish_greeting
set -U fish_key_bindings fish_vi_key_bindings
set -Ux EDITOR nvim
set -Ux COMPOSE_HTTP_TIMEOUT 86400

# For some reason, GOROOT defaults to 1.21.0
# set -Ux GOROOT /usr/local/Cellar/go/1.21.3/libexec
# set -Ux GOPROXY https://proxy.golang.org,direct
set -Ux GOROOT (brew --prefix golang)/libexec
set -Ux GOPATH /Users/joebonneau/git_repos
set -Ux FZF_DEFAULT_COMMAND "fd -H -E '.git'"
# ~/.tmux/plugins
fish_add_path $HOME/.tmux/plugins/t-smart-tmux-session-manager/bin
# ~/.config/tmux/plugins
fish_add_path $HOME/.config/tmux/plugins/t-smart-tmux-session-manager/bin

# fish_config theme save "TokyoNight Storm"

fish_add_path ~/.cargo/bin
fish_add_path ~/.config/bin
# golang - https://golang.google.cn/
set -Ux GOPATH (go env GOPATH)
fish_add_path $GOPATH/bin
