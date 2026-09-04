# Load External Plugins
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh 2>/dev/null

# Autosuggestion & Syntax Highlighting Customization
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#1b4d6e,bold"
ZSH_HIGHLIGHT_STYLES[path]='fg=#00f5ff,bold,underline'
ZSH_HIGHLIGHT_STYLES[path_prefix]='fg=#38bdf8,bold'
ZSH_HIGHLIGHT_STYLES[path_pathseparator]='fg=#5dfcff,bold'
ZSH_HIGHLIGHT_STYLES[default]='fg=#e0f2fe'
