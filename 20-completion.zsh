# Completion & Styling
autoload -Uz compinit
compinit

export LS_COLORS="$(vivid generate snazzy 2>/dev/null)"
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

# Clustered Dropdown Menu
zstyle ':completion:*:descriptions' format $'\e[1;38;5;212m✦ [ %d ]\e[0m'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select
