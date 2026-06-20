#!/bin/bash
# ============================================================
# Antigravity Global Config Deployment Script
# ============================================================
# This script copies the master global configuration from this
# repository into the local Antigravity config directory.
#
# Usage:
#   git clone https://github.com/faliqadlan/antigravity-agent-setup.git
#   cd antigravity-agent-setup
#   chmod +x setup.sh
#   ./setup.sh
# ============================================================

set -e

# Determine the script's directory (where the repo is cloned)
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
SOURCE_DIR="$SCRIPT_DIR/global_config"

# Determine the target directory based on OS
if [[ "$OSTYPE" == "msys" || "$OSTYPE" == "cygwin" || "$OSTYPE" == "win32" ]]; then
    # Windows (Git Bash / MSYS2 / Cygwin)
    TARGET="$USERPROFILE/.gemini/config"
elif [[ "$OSTYPE" == "darwin"* ]]; then
    # macOS
    TARGET="$HOME/.gemini/config"
else
    # Linux and other Unix-like systems
    TARGET="$HOME/.gemini/config"
fi

echo "============================================================"
echo "  Antigravity Global Config Deployment"
echo "============================================================"
echo ""
echo "  Source:  $SOURCE_DIR"
echo "  Target:  $TARGET"
echo ""

# Verify the source directory exists
if [ ! -d "$SOURCE_DIR" ]; then
    echo "ERROR: Source directory '$SOURCE_DIR' not found."
    echo "Make sure you are running this script from the repository root."
    exit 1
fi

# Create the target directory if it does not exist
mkdir -p "$TARGET"

# Copy global rules and skills
cp -r "$SOURCE_DIR"/* "$TARGET/"

echo "  ✅ Global AGENTS.md deployed successfully."
echo "  ✅ Global skills deployed successfully."
echo ""
echo "============================================================"
echo "  Your Antigravity agent is now upgraded!"
echo "  Open a new Antigravity conversation to use the new rules."
echo "============================================================"
