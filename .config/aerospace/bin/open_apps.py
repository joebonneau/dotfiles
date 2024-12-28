#!/usr/bin/env python3

import subprocess

APP_PATH_MAPPER = {
    # "Alacritty": "/Applications/Alacritty.app",
    "Ghostty": "/Applications/Ghostty.app",
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
    return result.stdout.strip()


def main():
    open_apps = run_command("aerospace list-apps")
    for name, path in APP_PATH_MAPPER.items():
        if name not in open_apps:
            subprocess.run(["open", path])


if __name__ == "__main__":
    main()
