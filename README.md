# dotfiles

```zsh
# clone repository
git clone https://github.com/tana2034/dotfiles.git ~/dotfiles
# install fzf, rg, etc..
brew install zsh-completions fzf ripgrep neovim node python3 direnv git curl sheldon
# add permission to init.sh
chmod +x ~/dotfiles/init.sh
# create symbolic link to home
~/dotfiles/init.sh
# mise
curl https://mise.run | sh
```
