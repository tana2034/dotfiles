#!/bin/zsh
set -e

echo "Starting dotfiles setup..."

# Install Homebrew if not installed
if ! command -v brew &> /dev/null; then
    echo "Homebrew not found. Installing..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    eval "$(/opt/homebrew/bin/brew shellenv)"
else
    echo "Homebrew is already installed."
fi

# Define dotfiles directory
dotfiles_dir=~/dotfiles

# Run brew bundle
if [ -f "$dotfiles_dir/Brewfile" ]; then
    echo "Installing packages from Brewfile..."
    brew bundle --file "$dotfiles_dir/Brewfile"
else
    echo "Brewfile not found. Skipping package installation."
fi

# Create symbolic links
echo "Creating symbolic links..."
ln -sfv "$dotfiles_dir/.zshrc" ~/.zshrc
ln -sfv "$dotfiles_dir/.gitconfig" ~/.gitconfig
ln -sfv "$dotfiles_dir/.gitignore_global" ~/.gitignore_global
ln -sfv "$dotfiles_dir/.rgignore" ~/.rgignore

# Create config directories and link files
mkdir -p ~/.config/sheldon
ln -sfv "$dotfiles_dir/.config/sheldon/plugins.toml" ~/.config/sheldon/plugins.toml

mkdir -p ~/.config/nvim
ln -sfv "$dotfiles_dir/.config/nvim" ~/.config/nvim

# Install mise
if ! command -v mise &> /dev/null; then
    echo "mise not found. Installing..."
    curl https://mise.run | sh
else
    echo "mise is already installed."
fi

echo "Dotfiles setup completed successfully!"
