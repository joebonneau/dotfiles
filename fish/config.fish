eval (/opt/homebrew/bin/brew shellenv)
starship init fish | source
zoxide init fish | source

set -U fish_greeting
set -U fish_key_bindings fish_vi_key_bindings
set -Ux EDITOR nvim

fish_config theme save "TokyoNight Storm"

fish_add_path ~/.config/bin
# golang - https://golang.google.cn/
set -Ux GOPATH (go env GOPATH)
fish_add_path $GOPATH/bin
