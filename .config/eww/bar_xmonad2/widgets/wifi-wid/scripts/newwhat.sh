#!/bin/bash

# Define the directory containing your Alacritty theme files.
themes_dir="/home/termai/github-more/github/alacritty-theme/themes"

# Use fzf with the --multi option to select multiple files.
selected_files=$(ls "$themes_dir" | fzf --select-1 --preview "cat {}"| sort)
filen=$(find /home/termai/github-more/github/alacritty-theme/themes/ -name "$selected_files")
# Check if files were selected.
if [ -n "$filen" ]; then
    for file in $selected_files; do
        # Execute a command (in this case, 'cat' for demonstration purposes).
        cp "$filen" /home/termai/.config/alacritty/alacritty.yml
        cat "$filen"
    done
else
    echo "No files selected."
fi
