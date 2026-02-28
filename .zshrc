# Powerlevel10k instant prompt設定
# quietモードに設定して、初期化中のコンソール出力による警告を抑制
typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet

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
# Cache brew prefix for faster startup / 起動高速化のためbrew prefixをキャッシュ
HOMEBREW_PREFIX="${HOMEBREW_PREFIX:-$(brew --prefix)}"
if [[ -f "$HOMEBREW_PREFIX/opt/fzf/shell/key-bindings.zsh" ]]; then
    source "$HOMEBREW_PREFIX/opt/fzf/shell/key-bindings.zsh"
fi

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

# System update functions / システム更新関数
# miseとHomebrewの両方を一括更新
upgrade-all() {
    echo "🔄 Starting system-wide package upgrade..."
    echo ""

    echo "📦 [1/2] Updating mise tools..."
    if command -v mise &> /dev/null; then
        mise upgrade
    else
        echo "⚠️  mise not found"
    fi

    echo ""
    echo "🍺 [2/2] Updating Homebrew packages..."
    if command -v brew &> /dev/null; then
        brew update && brew upgrade
    else
        echo "⚠️  Homebrew not found"
    fi

    echo ""
    echo "✅ All packages updated!"
}

autoload -U compinit
compinit

# mise - suppress output for instant prompt / instant prompt用に出力を抑制
if [[ -x ~/.local/bin/mise ]]; then
    eval "$(~/.local/bin/mise activate zsh 2>/dev/null)"
fi

# sheldon - suppress output for instant prompt / instant prompt用に出力を抑制
if command -v sheldon &> /dev/null; then
    eval "$(sheldon source 2>/dev/null)"
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
