function _fzf_ctrl_g_search --description "Run zi and replace current token with result"
    set result (z (zoxide query --list | fzf --cycle --layout=reverse --height=50%))
    commandline --current-token --replace $result
    commandline --function repaint
end

set -g _fzf_ctrl_g_key \cz

for mode in default insert
    bind --mode $mode $_fzf_ctrl_g_key _fzf_ctrl_g_search
end
