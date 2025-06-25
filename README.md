# dotfiles

This repository contains my personal dotfiles for setting up a development environment.

## Installation

1.  **Clone the repository:**

    ```zsh
    git clone https://github.com/tana2034/dotfiles.git ~/dotfiles
    ```

2.  **Install tools with Homebrew:**

    This will install essential command-line tools listed in the `Brewfile`.

    ```zsh
    brew bundle --file ~/dotfiles/Brewfile
    ```

3.  **Run the setup script:**

    This script creates symbolic links from this repository to your home directory.

    ```zsh
    chmod +x ~/dotfiles/init.sh
    ~/dotfiles/init.sh
    ```

4.  **Install mise:**

    `mise` is a tool for managing multiple versions of programming languages.

    ```zsh
    curl https://mise.run | sh
    ```
