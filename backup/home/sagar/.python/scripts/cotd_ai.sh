##!/bin/bash

COTD_FILE="$HOME/.cotd/linux_cmds.txt"
TODAY_LETTER=$(date +%d | awk '{printf "%c", 96 + int($1)}')

# fallback if letter is out of a-z
if [[ ! "$TODAY_LETTER" =~ [a-z] ]]; then
  TODAY_LETTER=a
fi

COTD_LINE=$(grep "^$TODAY_LETTER:" "$COTD_FILE")
COTD_CMD=$(echo "$COTD_LINE" | cut -d':' -f2 | xargs)

if [ -z "$COTD_CMD" ]; then
  echo "No command found for letter '$TODAY_LETTER'"
else
  echo "🧠 Command of the Day [$TODAY_LETTER]: $COTD_CMD"
  echo "🔍 Description:"
  tgpt "Explain the Linux command: $COTD_CMD"
fi

