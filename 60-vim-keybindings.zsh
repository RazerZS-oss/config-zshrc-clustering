bindkey -v
export KEYTIMEOUT=1
setopt PROMPT_SUBST

# Status Indicator Text
VIM_MODE_TXT="%F{#ff5555}%B[ VIM ]%b%f"
INS_MODE_TXT="%F{#8be9fd}%B[ INSERT ]%b%f"
CURRENT_VIM_STATUS=$INS_MODE_TXT

# Fungsi update indikator status & kursor
function set_cursor_shape {
  if [[ $KEYMAP == vicmd ]]; then
    CURRENT_VIM_STATUS=$VIM_MODE_TXT
    print -n "\e[2q" # Block cursor
  else
    CURRENT_VIM_STATUS=$INS_MODE_TXT
    print -n "\e[6q" # Beam/Pipe cursor
  fi
  zle reset-prompt
}

function zle-keymap-select {
  set_cursor_shape
}
zle -N zle-keymap-select

# Reset status ke INSERT setiap kali prompt baru diinisialisasi
function zle-line-init {
  CURRENT_VIM_STATUS=$INS_MODE_TXT
  print -n "\e[6q"
  zle reset-prompt
}
zle -N zle-line-init

# Reset status jika interupsi (Ctrl+C) terjadi
function TRAPINT {
  CURRENT_VIM_STATUS=$INS_MODE_TXT
  print -n "\e[6q"
  return $(( 128 + $1 ))
}

# Native Zsh History Search by Prefix
autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

# Insert Mode Bindings
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

# Allow Backspace & x in Command Mode
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
