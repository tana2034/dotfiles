#!/bin/zsh
#
# setup_claude.sh - Claude Code configuration setup
#
# This script creates symbolic links for Claude Code configuration files
# from this dotfiles repository to their expected locations.
#
# Usage:
#   ./setup_claude.sh         # Run the setup
#   ./setup_claude.sh --help  # Show this help message
#
# What it does:
#   - Links .claude.json → ~/.claude.json (home directory root)
#   - Links CLAUDE.md → ~/.claude/CLAUDE.md (Claude config directory)
#
# This allows you to manage Claude Code settings in this dotfiles repository
# while keeping them accessible to Claude Code in the expected locations.

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Helper functions
log_info() {
    echo -e "${GREEN}[INFO]${NC} $1"
}

log_warn() {
    echo -e "${YELLOW}[WARN]${NC} $1"
}

log_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

show_help() {
    echo -e "${BLUE}Claude Code Configuration Setup${NC}"
    echo ""
    echo "Usage:"
    echo "  ./setup_claude.sh         Run the setup"
    echo "  ./setup_claude.sh --help  Show this help message"
    echo ""
    echo "What it does:"
    echo "  • Links .claude.json → ~/.claude.json"
    echo "  • Links CLAUDE.md → ~/.claude/CLAUDE.md"
    echo ""
    echo "This allows you to manage Claude Code settings in this dotfiles"
    echo "repository while keeping them accessible to Claude Code."
    exit 0
}

# Check for help flag
if [[ "$1" == "--help" || "$1" == "-h" ]]; then
    show_help
fi

log_info "Starting Claude Code setup..."

# Define dotfiles directory (get the directory where this script is located)
dotfiles_dir="$(cd "$(dirname "${BASH_SOURCE[0]:-$0}")" && pwd)"
log_info "Using dotfiles directory: $dotfiles_dir"

# Link .claude.json to home directory root
if [ -f "$dotfiles_dir/.claude.json" ]; then
    log_info "Creating symbolic link for .claude.json..."
    ln -sfv "$dotfiles_dir/.claude.json" ~/.claude.json
    log_info "Linked .claude.json → ~/.claude.json"
else
    log_warn ".claude.json not found in $dotfiles_dir"
fi

# Create .claude directory in home if it doesn't exist for CLAUDE.md
claude_dir=~/.claude
if [ ! -d "$claude_dir" ]; then
    log_info "Creating $claude_dir directory..."
    mkdir -p "$claude_dir"
fi

# Link CLAUDE.md to .claude directory
if [ -f "$dotfiles_dir/CLAUDE.md" ]; then
    log_info "Creating symbolic link for CLAUDE.md..."
    ln -sfv "$dotfiles_dir/CLAUDE.md" "$claude_dir/CLAUDE.md"
    log_info "Linked CLAUDE.md → $claude_dir/CLAUDE.md"
else
    log_warn "CLAUDE.md not found in $dotfiles_dir"
fi

log_info "Claude Code setup completed successfully!"
log_info ".claude.json → ~/.claude.json"
log_info "CLAUDE.md → ~/.claude/CLAUDE.md"
