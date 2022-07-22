#!/usr/bin/env bash

set -euo pipefail

sock=$(find /tmp/ssh-* -type s -name "agent.*" -print0 | xargs -0 -r ls -1 -t | head -1)
export SSH_ATUH_SOCK="${sock}"
