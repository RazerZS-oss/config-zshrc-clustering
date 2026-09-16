bindkey -v
export KEYTIMEOUT=1
setopt PROMPT_SUBST

# Status Indicator Function
VIM_MODE_TXT="%F{#ff5555}%B[ VIM ]%b%f"
INS_MODE_TXT="%F{#8be9fd}%B[ INSERT ]%b%f"
CURRENT_VIM_STATUS=$INS_MODE_TXT

function zle-keymap-select {
  if [[ $KEYMAP == vicmd ]]; then
    CURRENT_VIM_STATUS=$VIM_MODE_TXT
  else
    CURRENT_VIM_STATUS=$INS_MODE_TXT
  fi
  zle reset-prompt
}
zle -N zle-keymap-select

# Native Zsh History Search by Prefix
autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

# Insert Mode Bindings (Tetap berada di Insert Mode)
bindkey '^[[A' up-line-or-beginning-search
bindkey '^[[B' down-line-or-beginning-search
bindkey '^K' up-line-or-beginning-search
bindkey '^J' down-line-or-beginning-search
bindkey '^?' backward-delete-char
bindkey '^H' backward-delete-char

# Vim Command Mode Bindings
bindkey -M vicmd 'k' up-line-or-beginning-search
bindkey -M vicmd 'j' down-line-or-beginning-search
bindkey -M vicmd '^[[A' up-line-or-beginning-search
bindkey -M vicmd '^[[B' down-line-or-beginning-search
bindkey -M vicmd 'K' up-line-or-history
bindkey -M vicmd 'J' down-line-or-history

# Izinkan Backspace menghapus karakter di Command Mode (Vicmd)
bindkey -M vicmd '^?' backward-delete-char
bindkey -M vicmd '^H' backward-delete-char
bindkey -M vicmd 'x' delete-char

# Vim Mode Toggles
bindkey -M viins '\e' vi-cmd-mode
bindkey -M vicmd 'i' vi-insert
bindkey -M vicmd 'I' vi-insert
bindkey -M vicmd 'a' vi-add-next
bindkey -M vicmd 'A' vi-add-eol

# Visual Selection Mode
bindkey -M vicmd 'v' visual-mode
bindkey -M vicmd 'V' visual-line-mode
bindkey -M visual 'j' down-line
bindkey -M visual 'k' up-line
bindkey -M visual 'h' backward-char
bindkey -M visual 'l' forward-char
