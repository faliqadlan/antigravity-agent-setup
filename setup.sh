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

# Detect WSL and set a secondary Windows target
WINDOWS_TARGET=""
if grep -qiE "(microsoft|wsl)" /proc/version 2>/dev/null; then
    # Running inside WSL — also deploy to the Windows user's .gemini/config
    WINDOWS_USER=$(cmd.exe /c "echo %USERNAME%" 2>/dev/null | tr -d '\r')
    if [ -n "$WINDOWS_USER" ]; then
        WINDOWS_TARGET="/mnt/c/Users/$WINDOWS_USER/.gemini/config"
    fi
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

# Copy global rules and skills to ~/.gemini/config/
cp -r "$SOURCE_DIR"/* "$TARGET/"

# Also deploy as GEMINI.md (the official global rules filename for Antigravity)
# Some Antigravity surfaces read from ~/.gemini/GEMINI.md instead of ~/.gemini/config/AGENTS.md
GEMINI_ROOT="$(dirname "$TARGET")"
cp "$SOURCE_DIR/AGENTS.md" "$GEMINI_ROOT/GEMINI.md"
cp "$SOURCE_DIR/AGENTS.md" "$TARGET/GEMINI.md"

echo "  ✅ Global AGENTS.md deployed successfully."
echo "  ✅ Global GEMINI.md deployed successfully (official filename)."
echo "  ✅ Global skills deployed successfully."

# Deploy to Windows path if running inside WSL
if [ -n "$WINDOWS_TARGET" ]; then
    mkdir -p "$WINDOWS_TARGET"
    cp -r "$SOURCE_DIR"/* "$WINDOWS_TARGET/"
    WINDOWS_GEMINI_ROOT="$(dirname "$WINDOWS_TARGET")"
    cp "$SOURCE_DIR/AGENTS.md" "$WINDOWS_GEMINI_ROOT/GEMINI.md"
    cp "$SOURCE_DIR/AGENTS.md" "$WINDOWS_TARGET/GEMINI.md"
    echo "  ✅ Windows Antigravity IDE config deployed to: $WINDOWS_TARGET"
fi

# Setup Git post-merge hook to automate syncing across machines
if git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
    GIT_DIR="$(git rev-parse --git-dir)"
    HOOKS_DIR="$GIT_DIR/hooks"
    mkdir -p "$HOOKS_DIR"
    
    if [ -f "$SCRIPT_DIR/scripts/post-merge" ]; then
        cp "$SCRIPT_DIR/scripts/post-merge" "$HOOKS_DIR/post-merge"
        chmod +x "$HOOKS_DIR/post-merge"
        echo "  ✅ Git post-merge hook automated sync configured."
    fi
fi

echo ""
echo "============================================================"
echo "  Your Antigravity agent is now upgraded!"
echo "  Open a new Antigravity conversation to use the new rules."
echo "============================================================"
