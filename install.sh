#!/usr/bin/env bash

set -e

TARGET_DIR="${HOME}/.zshrc.d"
REPO_URL="https://github.com/RazerZS-oss/config-zshrc-clustering.git"

echo "Installing Zsh Modular Config to ${TARGET_DIR}..."

# Clone or update config
if [ -d "$TARGET_DIR" ]; then
  echo "Updating existing config at ${TARGET_DIR}..."
  git -C "$TARGET_DIR" pull
else
  echo "Cloning config repository..."
  git clone "\(REPO_URL" "\)TARGET_DIR"
fi

# Backup existing .zshrc if present and not a loader
ZSHRC_FILE="${HOME}/.zshrc"
if [ -f "\(ZSHRC_FILE" ] && ! grep -q "zshrc.d" "\)ZSHRC_FILE"; then
  cp "\(ZSHRC_FILE" "\){ZSHRC_FILE}.bak.$(date +%s)"
  echo "Backup created at ${ZSHRC_FILE}.bak"
fi

# Write minimal loader to ~/.zshrc
cat << 'LOADER' > "$ZSHRC_FILE"
if [[ -d "$HOME/.zshrc.d" ]]; then
  for f in "$HOME/.zshrc.d/"*.zsh(N); do
    source "$f"
  done
fi
LOADER

echo "Installation complete! Restart your terminal or run: source ~/.zshrc"
