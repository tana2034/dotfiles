# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


# zsh-completions
fpath=(/usr/local/share/zsh-completions $fpath)
if [ -e ~/.zsh/completions ]; then
  fpath=(~/.zsh/completions $fpath)
fi

# fzf with improved settings
if command -v rg &> /dev/null; then
    export FZF_DEFAULT_COMMAND='rg --files --hidden --ignore-case --no-ignore --follow --glob "!.git/" --glob "!node_modules/" --glob "!.DS_Store" --glob "!*.log" --glob "!build/" --glob "!dist/"'
    export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
    export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'
fi
source "$(brew --prefix)/opt/fzf/shell/key-bindings.zsh"

# Modern CLI tools aliases
if command -v bat &> /dev/null; then
    alias cat='bat'
fi
if command -v eza &> /dev/null; then
    alias ls='eza'
    alias ll='eza -l'
    alias la='eza -la'
    alias tree='eza --tree'
fi
if command -v fd &> /dev/null; then
    alias find='fd'
fi

autoload -U compinit
compinit

# mise
eval "$(~/.local/bin/mise activate zsh)"
# sheldon
eval "$(sheldon source)"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
