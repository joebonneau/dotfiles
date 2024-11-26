#!/usr/bin/env python3


import subprocess
import sys

WORKSPACE_APP_PATH_MAPPER = {
    "Alacritty": "/Applications/Alacritty.app",
    "Vivaldi": "/Applications/Vivaldi.app",
    "Discord": "/Applications/Discord.app",
    "Messages": "/System/Applications/Messages.app",
    "Passwords": "/System/Applications/Passwords.app",
    "Spotify": "/Applications/Spotify.app",
    "Slack": "/Applications/Slack.app",
    "Zoom": "/Applications/Zoom.app",
}


def run_command(command):
    """Run a shell command and return its output"""
    result = subprocess.run(command.split(), capture_output=True, text=True)
    return result.stdout.strip() or result.stderr.strip()


def main():
    if len(sys.argv) < 2:
        print("Error: Please provide a workspace number")
        sys.exit(1)

    target_workspace = sys.argv[1]
    msg = run_command(f"aerospace workspace {target_workspace}")
    if msg == "":
        sys.exit(0)
    subprocess.run(["aerospace", "workspace-back-and-forth"])


if __name__ == "__main__":
    main()
