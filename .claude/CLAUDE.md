# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.
このファイルは、このリポジトリでコードを扱う際のClaude Code (claude.ai/code)への指針を提供します。

## Communication Preference / コミュニケーション設定

**Please communicate in Japanese when working with this repository.**
**このリポジトリで作業する際は日本語でコミュニケーションを取ってください。**

## Overview / 概要

This is a macOS dotfiles repository containing personal configuration files for development tools and shell setup. The repository uses a centralized approach where all configuration files are stored in the dotfiles directory and symlinked to their expected locations.

これは開発ツールとシェル設定のための個人設定ファイルを含むmacOS dotfilesリポジトリです。すべての設定ファイルをdotfilesディレクトリに保存し、期待される場所にシンボリックリンクを作成する集中管理アプローチを使用しています。

## Setup Commands / セットアップコマンド

### Initial Setup / 初期セットアップ
```bash
# Clone and setup on a new Mac / 新しいMacでクローンとセットアップ
git clone https://github.com/tana2034/dotfiles.git ~/dotfiles
chmod +x ~/dotfiles/init.sh
~/dotfiles/init.sh
```

### Development Commands / 開発コマンド
```bash
# Install/update packages from Brewfile / Brewfileからパッケージをインストール/更新
brew bundle --file ~/dotfiles/Brewfile

# Re-run the complete setup (creates symlinks) / 完全なセットアップを再実行（シンボリックリンク作成）
~/dotfiles/init.sh

# Reload shell configuration / シェル設定をリロード
source ~/.zshrc

# Check CLI tools guide / CLIツールガイドを確認
cat ~/dotfiles/CLI-TOOLS-GUIDE.md
```

## Repository Structure / リポジトリ構造

The repository follows a standard dotfiles pattern:
- `init.sh` - Main setup script that installs Homebrew, packages, and creates symlinks
- `Brewfile` - Homebrew bundle file defining all packages and tools
- Configuration files in root (`.zshrc`, `.gitconfig`, etc.) get symlinked to home directory
- `.config/` directory contains application-specific configurations

リポジトリは標準的なdotfilesパターンに従います：
- `init.sh` - Homebrew、パッケージをインストールし、シンボリックリンクを作成するメインセットアップスクリプト
- `Brewfile` - すべてのパッケージとツールを定義するHomebrew bundleファイル
- ルートの設定ファイル（`.zshrc`、`.gitconfig`、`.mise.toml`など）はホームディレクトリにシンボリックリンクされます
- `.config/`ディレクトリにはアプリケーション固有の設定が含まれます
- `CLI-TOOLS-GUIDE.md` - 新しいCLIツールの使い方ガイド

### Key Components / 主要コンポーネント

**Shell Setup / シェル設定:**
- Uses zsh with Powerlevel10k theme / Powerlevel10kテーマを使用したzsh
- Managed via sheldon plugin manager (`.config/sheldon/plugins.toml`) / sheldonプラグインマネージャーで管理
- Includes fzf with ripgrep integration for file searching / ファイル検索用のripgrep統合を含むfzf

**Development Tools / 開発ツール:**
- Neovim with lazy.nvim plugin manager / lazy.nvimプラグインマネージャーを使用したNeovim
- Git configuration with sensible defaults / 適切なデフォルト設定のGit設定
- mise for runtime version management / ランタイムバージョン管理用のmise
- ripgrep for fast text searching / 高速テキスト検索用のripgrep

**Package Management / パッケージ管理:**
- Homebrew for system packages / システムパッケージ用のHomebrew
- Brewfile contains: shell tools (fzf, ripgrep, sheldon), modern CLI tools (bat, exa, fd, htop, jq, tree, tmux, wget), development tools (neovim, node, python3, direnv) / Brewfileにはシェルツール（fzf、ripgrep、sheldon）、モダンCLIツール（bat、exa、fd、htop、jq、tree、tmux、wget）、開発ツール（neovim、node、python3、direnv）が含まれます

## Configuration Files / 設定ファイル

When modifying configurations:
- Edit files in the dotfiles directory, not in their symlinked locations
- Run `~/dotfiles/init.sh` after adding new symlinks to the script
- Global gitignore and rgignore files are configured for common development patterns

設定を変更する際は：
- シンボリックリンクされた場所ではなく、dotfilesディレクトリ内のファイルを編集してください
- スクリプトに新しいシンボリックリンクを追加した後は`~/dotfiles/init.sh`を実行してください
- グローバルgitignoreとrgignoreファイルは一般的な開発パターン用に設定されています

## Neovim Setup / Neovim設定

Neovim configuration uses:
- lazy.nvim as plugin manager
- Gruvbox colorscheme
- Basic editor settings optimized for development
- Plugins defined in `lua/plugins.lua`

Neovim設定は以下を使用します：
- プラグインマネージャーとしてlazy.nvim
- Gruvboxカラースキーム
- 開発向けに最適化された基本エディタ設定
- `lua/plugins.lua`で定義されたプラグイン

The configuration automatically installs lazy.nvim on first run.
設定は初回実行時にlazy.nvimを自動的にインストールします。