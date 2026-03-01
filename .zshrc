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

# 履歴設定
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt HIST_IGNORE_DUPS
setopt SHARE_HISTORY

# fzf with improved settings
if command -v rg &> /dev/null; then
    export FZF_DEFAULT_COMMAND='rg --files --hidden --ignore-case --no-ignore --follow --glob "!.git/" --glob "!node_modules/" --glob "!.DS_Store" --glob "!*.log" --glob "!build/" --glob "!dist/"'
    export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
    export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'
fi
# Apple Silicon Mac では /opt/homebrew 固定（brew --prefix 呼び出しを省略して高速化）
HOMEBREW_PREFIX="/opt/homebrew"
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
if command -v lazygit &> /dev/null; then
    alias lg='lazygit'
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

# 24時間に1回だけ補完キャッシュを再生成（それ以外は高速な -C オプションでスキップ）
autoload -U compinit
if [[ -n ~/.zcompdump(#qN.mh+24) ]]; then
    compinit
else
    compinit -C
fi

# mise - Homebrew または ~/.local/bin どちらでインストールしても動作するよう command -v で検出
if command -v mise &> /dev/null; then
    eval "$(mise activate zsh 2>/dev/null)"
fi

# sheldon - suppress output for instant prompt / instant prompt用に出力を抑制
if command -v sheldon &> /dev/null; then
    eval "$(sheldon source 2>/dev/null)"
fi

# zoxide: 高速ディレクトリジャンプ（`z <dir>` で移動）
if command -v zoxide &> /dev/null; then
    eval "$(zoxide init zsh)"
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
