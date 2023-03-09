# dotfiles

```zsh
# clone repository
git clone git@github.com:tana2034/dotfiles.git ~/dotfiles
# clone prezto
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
# create setting files, .zshrc should be deleted manually after running
# refer the official document https://github.com/sorin-ionescu/prezto#installation
setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done
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
