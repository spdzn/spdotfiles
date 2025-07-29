#!/bin/bash

# Get the command of the day from your cotd script (adjust this path if needed)
COMMAND=$(~/.python/scripts/cotd.py)

# Show the command
echo -e "\033[1;36m🧠 Command of the Day:\033[0m $COMMAND"
echo ""

# Ask tgpt to explain it (requires the `tgpt` command to be set up already)
echo -e "\033[1;33m🤖 AI Explanation:\033[0m"
tgpt "Explain this terminal command: $COMMAND"
