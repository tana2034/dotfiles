#!/bin/zsh
dotfiles_dir=~/dotfiles
ln -sf $dotfiles_dir/.zshrc ~/.zshrc
ln -sf $dotfiles_dir/.vimrc ~/.vimrc
ln -sf $dotfiles_dir/.gitignore_global ~/.gitignore_global
ln -sf $dotfiles_dir/.config/sheldon/plugins.toml ~/.config/sheldon/plugins.toml