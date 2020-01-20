
# TODO(rkm 2020-01-19) Move this to a Gist or something

import argparse
import os
import re
import sys
from pathlib import Path


_IGNORES = [
    ".git",
    "venv"
]


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("query")
    parser.add_argument("extension")
    parser.add_argument("--ignore-case", action="store_true")
    parser.add_argument("--exact", action="store_true")
    parser.add_argument("-v", "--verbose", action="store_true")
    args = parser.parse_args()
    if args.ignore_case and args.exact:
        raise AttributeError("--ignore-case and --exact are mutually exclusive")
    query = args.query
    if args.exact:
        query = re.compile(rf"\b{query}\b")
    elif args.ignore_case:
        query = re.compile(query, re.IGNORECASE)
    ext = args.extension.lower()
    if not ext.startswith("."):
        ext = "." + ext
    matches = {}
    dirs_walked = 0
    files_opened = 0
    for root, dirs, files in os.walk(".", topdown=True, followlinks=True):
        dirs_walked += 1
        dirs[:] = [d for d in dirs if d not in _IGNORES]
        for file in [f for f in files if f.lower().endswith(ext)]:
            path = Path(root, file)
            if args.verbose:
                print(f"Checking {path}")
            try:
                with open(path) as f:
                    text = f.read().splitlines()
            except Exception as e:
                print(f"Couldn't get text from {path}: {e}", file=sys.stderr)
            files_opened += 1
            matches[path] = []
            for idx, line in enumerate(text):
                if re.search(query, line):
                    matches[path].append([idx, line])
    for file, match_lines in matches.items():
        if not match_lines:
            continue
        print(file)
        for m in match_lines:
            print(f"{m[0]}:\t{m[1].strip()}")
    print(f"\nDirs walked {dirs_walked}, Files opened {files_opened}")
    return 0


if __name__ == "__main__":
    sys.exit(main())
