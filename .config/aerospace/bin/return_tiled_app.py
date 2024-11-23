#!/usr/bin/env python3


import json
import subprocess

APP_WORKSPACE_MAPPER = {
    "Alacritty": "A",
    "Vivaldi": "C",
    "Discord": "D",
    "Messages": "M",
    "Passwords": "P",
    "Spotify": "S",
    "Slack": "T",
    "Zoom": "Z",
}


def run_command(command):
    """Run a shell command and return its output"""
    result = subprocess.run(command.split(), capture_output=True, text=True)
    return result.stdout.strip()


def main():
    focused_window_json = json.loads(
        run_command("aerospace list-windows --focused --json")
    )
    if not focused_window_json:
        exit(1)
    focused_app = focused_window_json[0]["app-name"]
    focused_workspace = run_command("aerospace list-workspaces --focused")
    app_workspace = APP_WORKSPACE_MAPPER[focused_app]
    if app_workspace != focused_workspace:
        subprocess.run(
            [
                "aerospace",
                "move-node-to-workspace",
                "--focus-follows-window",
                app_workspace,
            ]
        )
        exit(0)
    else:
        windows = json.loads(
            run_command(
                f"aerospace list-windows --workspace {focused_workspace} --json"
            )
        )
        for window in windows:
            app_workspace = APP_WORKSPACE_MAPPER.get(window["app-name"])
            if app_workspace and app_workspace != focused_workspace:
                subprocess.run(
                    [
                        "aerospace",
                        "move-node-to-workspace",
                        "--focus-follows-window",
                        app_workspace,
                    ]
                )
                exit(0)
        exit(1)


if __name__ == "__main__":
    main()
