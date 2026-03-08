# 💻 Khoirul's Dotfiles (Config)

This repository contains my personal configuration files for various tools and applications on macOS.
Everything is centralized in the `~/.config` directory and managed via Git.

## 📁 Structure

- **zsh/**: My Zsh configuration, aliases, and environment variables.
- **kaku/**: Kaku Terminal settings and Zsh integrations.
- **nvim/**: Neovim configuration.
- **ghostty/**: Ghostty terminal emulator configuration.
- **starship/**: Starship cross-shell prompt configuration.
- **zed/**: Zed editor settings and keymaps.
- **yazi/**: Yazi terminal file manager configuration.
- **fastfetch/**: System information fetching tool configuration.
- _And various other tool configs..._

## 🔒 Secrets Management

Sensitive information (like API keys) is kept out of this repository. They are stored locally in `zsh/.secrets` or `zsh/.zprofile.local` which are explicitly ignored in `.gitignore`.

## 🚀 Installation & Syncing

1. Clone this repository to your local `~/.config` directory:
   ```bash
   git clone https://github.com/masmuss/dotfiles.git ~/.config
   ```
2. Restart your terminal or source your shell:
   ```bash
   source ~/.config/zsh/.zshrc
   ```

---

_Created and maintained with ❤️ and ☕️._
