#!/usr/bin/env bash

set -e

TARGET_DIR="${HOME}/.zshrc.d"
REPO_URL="https://github.com/RazerZS-oss/config-zshrc-clustering.git"

echo "Installing/Updating Zsh Modular Config at ${TARGET_DIR}..."

if [ -d "$TARGET_DIR/.git" ]; then
  echo "Fetching latest changes from GitHub..."
  git -C "$TARGET_DIR" fetch origin main
  git -C "$TARGET_DIR" reset --hard origin/main
else
  echo "Cloning fresh configuration repository..."
  git clone "\(REPO_URL" "\)TARGET_DIR"
fi

ZSHRC_FILE="${HOME}/.zshrc"
if [ -f "\(ZSHRC_FILE" ] && ! grep -q "zshrc.d" "\)ZSHRC_FILE"; then
  cp "\(ZSHRC_FILE" "\){ZSHRC_FILE}.bak.$(date +%s)"
  echo "Backup created at ${ZSHRC_FILE}.bak"
fi

cat << 'LOADER' > "$ZSHRC_FILE"
if [[ -d "$HOME/.zshrc.d" ]]; then
  for f in "$HOME/.zshrc.d/"*.zsh(N); do
    source "$f"
  done
fi
LOADER

echo "Installation complete! Restart your terminal or run: source ~/.zshrc"
