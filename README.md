# dotfiles

My personal dotfiles for macOS.

## Quick Setup

To set up a new Mac, simply clone this repository and run the `init.sh` script.

```zsh
# Clone the repository (can be anywhere)
git clone https://github.com/tana2034/dotfiles.git ~/repositories/dotfiles

# Run the setup script
cd ~/repositories/dotfiles
./init.sh
```

This script will automatically:

1.  Install [Homebrew](https://brew.sh/) if it's not already installed.
2.  Install all necessary packages and applications from the `Brewfile`.
3.  Create symbolic links for the configuration files.
4.  Install [mise](https://mise.run/) for managing language runtimes.

## Claude Code Setup

To set up Claude Code configuration:

```zsh
./setup_claude.sh
```

This creates symbolic links for:
- `.claude.json` → `~/.claude.json`
- `CLAUDE.md` → `~/.claude/CLAUDE.md`

For more information, run `./setup_claude.sh --help`.
