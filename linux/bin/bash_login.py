#!/usr/bin/env python3
import os
import subprocess
from pathlib import Path

_LAST_RUN_PATH = Path("/home/rkm/.au.last.tmp")
_LAST_BOOT_PATH = Path("/home/rkm/.au.boot.log")


def main() -> int:
    if os.getenv("TERM") == "screen" and os.getenv("TMUX"):
        print("tmux detected - not running")
        return 0
    if (
        _LAST_RUN_PATH.is_file()
        and _LAST_BOOT_PATH.is_file()
        and _LAST_BOOT_PATH.stat().st_mtime < _LAST_RUN_PATH.stat().st_mtime
    ):
        print("last run file is newer - not running")
        return 0
    print("Running au")
    _LAST_RUN_PATH.touch(exist_ok=True)
    subprocess.Popen(
        ("nohup", "au"), stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL,
    )
    return 0


if __name__ == "__main__":
    exit(main())
