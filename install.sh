#!/usr/bin/env bash

echo "Installing Zsh Modular Config..."

# Clone or update config
if [ -d "$HOME/.zshrc.d" ]; then
  echo "Updating existing ~/.zshrc.d..."
  git -C "$HOME/.zshrc.d" pull
else
  git clone https://github.com/RazerZS-oss/config-zshrc-clustering.git "$HOME/.zshrc.d"
fi

# Backup existing .zshrc if present and not a loader
if [ -f "\(HOME/.zshrc" ] && ! grep -q "zshrc.d" "\)HOME/.zshrc"; then
  cp "\(HOME/.zshrc" "\)HOME/.zshrc.bak.$(date +%s)"
  echo "Backup created at ~/.zshrc.bak"
fi

# Write minimal loader to ~/.zshrc
cat << 'LOADER' > "$HOME/.zshrc"
if [[ -d "$HOME/.zshrc.d" ]]; then
  for f in "$HOME/.zshrc.d/"*.zsh(N); do
    source "$f"
  done
fi
LOADER

echo "Installation complete! Restart your terminal or run: source ~/.zshrc"
