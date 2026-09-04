# Vim Mode Setup
bindkey -v
export KEYTIMEOUT=1
setopt PROMPT_SUBST

VIM_MODE_TXT="%F{#ff007f}%BVIM%b%f"
INS_MODE_TXT="%F{#00f5ff}%BINSERT%b%f"
CURRENT_VIM_STATUS=$INS_MODE_TXT

# Vim Mode Toggles
bindkey -M viins '\e' vi-cmd-mode
bindkey -M vicmd 'i' vi-insert
bindkey -M vicmd 'I' vi-insert
bindkey -M vicmd 'a' vi-add-next
bindkey -M vicmd 'A' vi-add-eol

# Global History Jump
bindkey '^K' up-history
bindkey '^J' down-history
bindkey -M vicmd '^K' up-history
bindkey -M vicmd '^J' down-history

# Contextual Prefix Search
autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

bindkey '^[[A' up-line-or-beginning-search
bindkey '^[[B' down-line-or-beginning-search
bindkey -M vicmd '^[[A' up-line-or-beginning-search
bindkey -M vicmd '^[[B' down-line-or-beginning-search

# Standard Vim Mode Navigation
bindkey -M vicmd 'k' up-line
bindkey -M vicmd 'j' down-line
bindkey -M vicmd 'K' up-history
bindkey -M vicmd 'J' down-history

# Visual Selection Mode
bindkey -M vicmd 'v' visual-mode
bindkey -M vicmd 'V' visual-line-mode
bindkey -M visual 'j' down-line
bindkey -M visual 'k' up-line
bindkey -M visual 'J' down-line
bindkey -M visual 'K' up-line
bindkey -M visual 'h' backward-char
bindkey -M visual 'l' forward-char
