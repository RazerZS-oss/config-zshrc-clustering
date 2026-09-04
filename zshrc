# Modular zsh configuration loader.
if [[ -d "$HOME/.zshrc.d" ]]; then
  for f in "$HOME/.zshrc.d/"*.zsh(N); do
    source "$f"
  done
fi
