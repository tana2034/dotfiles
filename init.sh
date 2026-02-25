#!/bin/zsh
set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
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

# Check if running on macOS
if [[ "$OSTYPE" != "darwin"* ]]; then
    log_error "This script is designed for macOS only."
    exit 1
fi

log_info "Starting dotfiles setup..."

# Install Homebrew if not installed
if ! command -v brew &> /dev/null; then
    log_info "Homebrew not found. Installing..."
    if /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"; then
        eval "$(/opt/homebrew/bin/brew shellenv)"
        log_info "Homebrew installed successfully."
    else
        log_error "Failed to install Homebrew."
        exit 1
    fi
else
    log_info "Homebrew is already installed."
fi

# Define dotfiles directory (get the directory where this script is located)
dotfiles_dir="$(cd "$(dirname "${BASH_SOURCE[0]:-$0}")" && pwd)"
log_info "Using dotfiles directory: $dotfiles_dir"

# Run brew bundle
if [ -f "$dotfiles_dir/Brewfile" ]; then
    log_info "Installing packages from Brewfile..."
    if brew bundle --file "$dotfiles_dir/Brewfile"; then
        log_info "Packages installed successfully."
    else
        log_error "Failed to install some packages."
        exit 1
    fi
else
    log_warn "Brewfile not found. Skipping package installation."
fi

# Create symbolic links
log_info "Creating symbolic links..."
files_to_link=(
    ".zshrc"
    ".gitconfig"
    ".gitignore_global"
    ".rgignore"
    ".mise.toml"
)

for file in "${files_to_link[@]}"; do
    if [ -f "$dotfiles_dir/$file" ]; then
        ln -sfv "$dotfiles_dir/$file" ~/"$file"
        log_info "Linked $file"
    else
        log_warn "File $file not found in dotfiles directory."
    fi
done

# Create config directories and link files
log_info "Setting up config directories..."
mkdir -p ~/.config/sheldon
if [ -f "$dotfiles_dir/.config/sheldon/plugins.toml" ]; then
    ln -sfv "$dotfiles_dir/.config/sheldon/plugins.toml" ~/.config/sheldon/plugins.toml
    log_info "Linked sheldon config"
else
    log_warn "sheldon config not found."
fi

mkdir -p ~/.config/nvim
if [ -d "$dotfiles_dir/.config/nvim" ]; then
    ln -sfv "$dotfiles_dir/.config/nvim" ~/.config/nvim
    log_info "Linked nvim config"
else
    log_warn "nvim config directory not found."
fi

mkdir -p ~/.config/ghostty
if [ -f "$dotfiles_dir/.config/ghostty/config" ]; then
    ln -sfv "$dotfiles_dir/.config/ghostty/config" ~/.config/ghostty/config
    log_info "Linked ghostty config"
else
    log_warn "ghostty config not found."
fi

# Install mise
if ! command -v mise &> /dev/null; then
    log_info "mise not found. Installing..."
    if curl https://mise.run | sh; then
        log_info "mise installed successfully."
    else
        log_error "Failed to install mise."
        exit 1
    fi
else
    log_info "mise is already installed."
fi

log_info "Dotfiles setup completed successfully!"
log_info "Please restart your terminal or run 'source ~/.zshrc' to apply changes."
