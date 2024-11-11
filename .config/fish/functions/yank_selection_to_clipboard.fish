function yank_selection_to_clipboard
    commandline -f | fish_clipboard_copy
    commandline -f end-selection repaint-mode
end
