#!/bin/zsh
set -e

dotfiles_dir=~/dotfiles
ln -sf $dotfiles_dir/.zshrc ~/.zshrc
ln -sf $dotfiles_dir/.gitignore_global ~/.gitignore_global
ln -sf $dotfiles_dir/.config/sheldon/plugins.toml ~/.config/sheldon/plugins.toml
ln -sf $dotfiles_dir/.config/nvim ~/.config/nvim
ln -sf $dotfiles_dir/.rgignore ~/.rgignore