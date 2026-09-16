⚡ Modular Zsh ConfigurationA lightweight, fast, and modern modular Zsh configuration. Features Vim keybindings, dynamic cursor indicators, prefix history search, and a clean, structured module management setup.Key Features • Installation • Module Structure • Keybindings🚀 Key Features📦 Fully-Clustered Modular Structure: All configurations are cleanly separated by functionality inside the ~/.zshrc.d/ directory.⌨️ Smart Vim Keybindings Module:Responsive Insert vs Command (Vim) modes.Dynamic Cursor Shape: Cursor automatically switches to a Solid Block (█) in Vim mode and a Line/Pipe (|) in Insert mode.Auto-Reset Status: Pressing Ctrl + C automatically resets the text status indicator and cursor back to [ INSERT ].🔍 Native Prefix History Search: Navigate command history based on typed prefix using k/j (Vim mode) or Ctrl + K/Ctrl + J / Up & Down Arrows (Insert mode).⚡ Clean Prompt & Alias Management: Keeps your terminal output clean by disabling automatic ls execution when changing directories (cd).📥 InstallationYou can instantly set up this configuration using the one-line installer:Bashcurl -fsSL [https://raw.githubusercontent.com/RazerZS-oss/config-zshrc-clustering/main/install.sh](https://raw.githubusercontent.com/RazerZS-oss/config-zshrc-clustering/main/install.sh) | bash
Once installation is complete, reload your Zsh configuration:Bashsource ~/.zshrc
Note: The installation script automatically backs up your existing ~/.zshrc file (if present) and clones the modules to ~/.zshrc.d/.🗂️ Module StructureEvery file in ~/.zshrc.d/ is automatically loaded in numerical order based on its prefix:Plaintext~/.zshrc.d/
├── 10-env.zsh             # Environment variables & PATH settings
├── 20-completion.zsh      # Auto-completion setup & Zsh options
├── 30-fzf.zsh             # FZF (Fuzzy Finder) integration
├── 40-aliases.zsh         # Custom aliases & command shortcuts
├── 50-plugins.zsh         # Additional Zsh plugins
├── 60-vim-keybindings.zsh # Vim mode configuration, status indicator, & cursor shape
├── 70-functions.zsh       # Custom functions & hooks
├── 80-prompt.zsh          # Prompt theme & appearance customization
└── install.sh             # Automation installation script
⌨️ Vim Keybindings & ShortcutsModeKeybindingActionInsertEscEnter Vim Command ModeInsertCtrl + K / ▲Search history upward matching typed prefixInsertCtrl + J / ▼Search history downward matching typed prefixVim (Cmd)i / aReturn to Insert ModeVim (Cmd)k / jHistory navigation by prefixVim (Cmd)x / BackspaceDelete characterGlobalCtrl + CCancel line input & reset status indicator to [ INSERT ]🔄 UpdatingTo update your setup to the latest version from GitHub, run:Bashgit -C ~/.zshrc.d pull
source ~/.zshrc
Created by RazerZS-oss
