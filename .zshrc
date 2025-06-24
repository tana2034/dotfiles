# Prezto
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# zsh-completions
fpath=(/usr/local/share/zsh-completions $fpath)
if [ -e ~/.zsh/completions ]; then
  fpath=(~/.zsh/completions $fpath)
fi

# fzf
if [ -e /usr/local/bin/rg ]; then
    export FZF_DEFAULT_COMMAND='rg --files --hidden --ignore-case --no-ignore --follow --glob "!*.git*" --glob "!*node_modules*"'
    export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
fi
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

autoload -U compinit
compinit

eval "$(~/.local/bin/mise activate zsh)"