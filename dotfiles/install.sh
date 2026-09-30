#!/usr/bin/env bash
# Cria links simbólicos das configs do repositório para o $HOME.
# Arquivos existentes são movidos para <arquivo>.bak antes de linkar.
set -euo pipefail
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

link() {
  local src="$DIR/$1" dst="$2"
  mkdir -p "$(dirname "$dst")"
  if [ -e "$dst" ] && [ ! -L "$dst" ]; then
    mv "$dst" "$dst.bak"
    echo "backup: $dst.bak"
  fi
  ln -sfn "$src" "$dst"
  echo "link:   $dst -> $src"
}

link zsh/.zshrc "$HOME/.zshrc"
link kitty      "$HOME/.config/kitty"
