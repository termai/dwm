#!/bin/bash
#
#dwmswallow $WINDOWID; zathura 
#(dwmswallow $WINDOWID && zathura )

# Check if a command and a file are provided
if [ -n "$1" ] && [ -n "$2" ]; then
    # Run dwmswallow in the background
    (dwmswallow $WINDOWID &)

    # Wait for a short period to ensure dwmswallow has time to take effect

    # Run the provided command with the specified file
    "$1" "$2"
else
    echo "Usage: $0 <command> <file>"
fi
