#!/bin/bash

set -e

# Call Claude with the master prompt - Claude will handle running start-dev.sh
/usr/local/bin/claude --dangerously-skip-permissions "$(cat ./web-app-developer-master-prompt.md)"
