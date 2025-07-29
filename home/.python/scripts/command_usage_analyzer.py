import os
from collections import Counter
import re

HISTORY_FILE = os.path.expanduser("~/.config/zsh/zhistory")
TOP_N = 20

def extract_commands(file_path):
    commands = []
    with open(file_path, 'r', encoding='utf-8', errors='ignore') as f:
        for line in f:
            line = line.strip()
            if not line:
                continue  # skip empty lines
            # zsh history might have timestamps like `: 1719812425:0;command`
            if line.startswith(": "):
                line = line.split(";", 1)[-1]  # remove timestamp
            try:
                command = line.split()[0]
                commands.append(command)
            except IndexError:
                continue  # skip lines that don't split into words
    return commands

def count_commands(commands):
    return Counter(commands)

def display_top_commands(counter, top_n):
    print(f"\n📊 Top {top_n} Most Used Commands:\n")
    for i, (cmd, count) in enumerate(counter.most_common(top_n), 1):
        print(f"{i:>2}. {cmd:<15} ➜ {count} times")

def main():
    print("📜 Reading command history...")
    if not os.path.exists(HISTORY_FILE):
        print("❌ History file not found!")
        return
    commands = extract_commands(HISTORY_FILE)
    counter = count_commands(commands)
    display_top_commands(counter, TOP_N)

if __name__ == "__main__":
    main()
