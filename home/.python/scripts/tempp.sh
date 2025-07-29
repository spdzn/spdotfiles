#!/usr/bin/env python3

from rich.console import Console
from rich.panel import Panel
from rich.markdown import Markdown
import random

linux_commands = [
    "alias", "awk", "apt", "arch", "basename", "bc", "bg", "bat", "cat", "chown", "chmod", "cp",
    "curl", "cal", "crontab", "date", "df", "du", "diff", "dmesg", "dig", "echo", "env", "exit",
    "exec", "find", "fg", "free", "finger", "grep", "git", "groupadd", "head", "htop", "hostname",
    "history", "id", "ip", "install", "jobs", "journalctl", "join", "kill", "kmod", "kbd", "less",
    "ls", "ln", "login", "locate", "man", "mv", "mkdir", "more", "mount", "nano", "netstat", "nc",
    "nmap", "open", "openssl", "od", "ps", "pwd", "ping", "pacman", "printenv", "parted", "quit",
    "rm", "rmdir", "rsync", "read", "reboot", "sed", "sort", "ssh", "scp", "screen", "touch", "top",
    "tar", "tee", "tail", "uname", "uptime", "umount", "vim", "vi", "view", "valgrind", "who",
    "wget", "whereis", "which", "xdg-open", "xargs", "xclip", "yes", "yarn", "youtube-dl",
    "zcat", "zip", "zgrep", "zsh"
]

command_descriptions = {
    "ls": "List directory contents",
    "cat": "Concatenate and display files",
    "grep": "Search for patterns in text",
    "curl": "Transfer data from or to a server",
    "df": "Report disk space usage",
    "top": "Display system tasks",
    "ps": "Show process status",
    "htop": "Improved process viewer",
    "awk": "Pattern scanning and processing",
    "sed": "Stream editor for filtering text",
    "chmod": "Change file permissions",
    "chown": "Change file owner/group",
    "ssh": "Remote shell access",
    "scp": "Secure copy over SSH",
    "wget": "Non-interactive file downloader",
    "tar": "Archive tool",
    "man": "Manual page viewer",
    "rm": "Delete files or directories",
    "mv": "Move/rename files",
    "cp": "Copy files or directories",
    "nano": "Text editor",
    "vim": "Advanced text editor",
    "zsh": "Interactive shell with bells & whistles",
}

cmd = random.choice(linux_commands)
desc = command_descriptions.get(cmd, f"No description available. Try `man {cmd}`")

console = Console()
console.print(
    Panel.fit(
        Markdown(f"# 🧠 Command of the Day\n\n### `{cmd}` — {desc}"),
        border_style="magenta",
        title="Linux A–Z",
        subtitle="Power up your terminal",
        padding=(1, 4)
    )
)
