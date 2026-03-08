# Homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# Locale
export LANG=en_US.UTF-8

#------------Environment Variables------------

# History
export HIST_IGNORE="(ls|ll|cd|pwd|exit|sudo reboot|history|cd -|cd ..|..|...|clear|code|zed|ws|golang|studio)"

# Starship
export STARSHIP_CONFIG="$HOME/.config/starship/starship.toml"

#------------Tool Homes------------

# Go
export GOPATH=$HOME/go

# Bun
export BUN_INSTALL="$HOME/.bun"

# pnpm
export PNPM_HOME="$HOME/Library/pnpm"

# NVM
export NVM_DIR="$HOME/.nvm"

#------------All PATHS------------

# Local binaries
export PATH="$HOME/.local/bin:$PATH"

# Antigravity
export PATH="$HOME/.antigravity/antigravity/bin:$PATH"

# Dart/Flutter pub cache
export PATH="$HOME/.pub-cache/bin:$PATH"

# Bun
export PATH="$BUN_INSTALL/bin:$PATH"

# Go
export PATH="$GOPATH/bin:$PATH"

# JetBrains Toolbox
export PATH="$PATH:$HOME/Library/Application Support/JetBrains/Toolbox/scripts"

# Python 3.12
export PATH="/Library/Frameworks/Python.framework/Versions/3.12/bin:${PATH}"

# pnpm (conditional)
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

# Load secrets from .secrets file
if [[ -f "$HOME/.config/zsh/.secrets" ]]; then
  export $(grep -v '^#' "$HOME/.config/zsh/.secrets" | xargs)
fi

#------------Tools------------

# OrbStack: command-line tools and integration
source ~/.orbstack/shell/init.zsh 2>/dev/null || :
