# dotfiles

My personal dotfiles for macOS.

## Quick Setup

To set up a new Mac, simply clone this repository and run the `init.sh` script.

```zsh
# Clone the repository
git clone https://github.com/tana2034/dotfiles.git ~/dotfiles

# Run the setup script
chmod +x ~/dotfiles/init.sh
~/dotfiles/init.sh
```

This script will automatically:

1.  Install [Homebrew](https://brew.sh/) if it's not already installed.
2.  Install all necessary packages and applications from the `Brewfile`.
3.  Create symbolic links for the configuration files.
4.  Install [mise](https://mise.run/) for managing language runtimes.
