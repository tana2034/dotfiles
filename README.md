# dotfiles

```zsh
# clone repository
git clone git@github.com:tana2034/dotfiles.git ~/dotfiles
# clone prezto
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
# install fzf, rg, etc..
brew install zsh-completions fzf ripgrep neovim node python3 anyenv direnv git curl
# add permission to init.sh
chmod +x ~/dotfiles/init.sh
# create symbolic link to home
~/dotfiles/init.sh
# anyenv
anyenv init
anyenv install --init
```