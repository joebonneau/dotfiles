eval (/opt/homebrew/bin/brew shellenv)
status --is-interactive; and starship init fish | source
status --is-interactive; and zoxide init fish | source
status --is-interactive; and pyenv init - | source
status --is-interactive; and pyenv virtualenv-init - | source
status --is-interactive; and fzf --fish | source
status --is-interactive; and fnm env --use-on-cd --shell fish | source

bind -M visual y "commandline --current-selection | fish_clipboard_copy; commandline -f end-selection"
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

# fish_config theme save "TokyoNight Storm"

fish_add_path ~/.cargo/bin
fish_add_path ~/.config/bin
# golang - https://golang.google.cn/
set -Ux GOPATH (go env GOPATH)
fish_add_path $GOPATH/bin

# Created by `pipx` on 2024-06-22 15:46:03
set PATH $PATH /Users/joebonneau/.local/bin
