# Powerlevel10k Instant Prompt (harus di paling atas)
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

#------------Oh-My-Zsh Configuration------------

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"

plugins=(
  git
  zsh-autosuggestions
  dirhistory
  fzf
  command-not-found
  sudo
  colored-man-pages
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

#------------Aliases------------

# Directory listing (eza)
alias tree='eza -a --tree --color always --icons --group-directories-first'
alias ls='eza --color always --icons --group-directories-first'
alias la='eza -a -l -b --color always --icons --group-directories-first'
alias ll='eza -l -b --color always --icons --group-directories-first'

# Navigation
alias ..='cd ..'
alias ...='cd ../..'
alias prj='cd ~/project'
alias pprj='cd ~/project/personal'

# Docker
alias compose='docker compose'
alias cup='docker compose up'
alias cdown='docker compose down'

# Laravel
alias artisan='php artisan'

# Tools
alias vim='nvim'
alias atg='antigravity'
alias zshconfig='nvim $ZDOTDIR/.zshrc'

# Utilities
alias h='history'
alias ff='fastfetch'

# Project scaffolding
alias shadcn-init='bunx --bun shadcn@latest init'
alias drizzle-pg-init='bun add drizzle-orm pg dotenv && bun add -D drizzle-kit tsx @types/pg'
alias biome-init='bun add -d @biomejs/biome && bunx --bun biome init'

#------------Functions------------

# Auto-switch Node version based on .nvmrc
load-nvmrc() {
  local node_version="$(nvm version)"
  local nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$node_version" ]; then
      nvm use
    fi
  elif [ "$node_version" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}

#------------Tool Integrations------------

# NVM
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"

# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Bun completions
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

# Ruby (chruby)
source /opt/homebrew/opt/chruby/share/chruby/chruby.sh
source /opt/homebrew/opt/chruby/share/chruby/auto.sh
chruby ruby-3.3.5

# Terraform
autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /opt/homebrew/bin/terraform terraform

# iTerm2 integration
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# Dart completions
[[ -f $HOME/.dart-cli-completion/zsh-config.zsh ]] && . $HOME/.dart-cli-completion/zsh-config.zsh || true

# ngrok completions
if command -v ngrok &>/dev/null; then
  eval "$(ngrok completion)"
fi

#------------Hooks------------

# Auto-load .nvmrc on directory change
autoload -U add-zsh-hook
add-zsh-hook chpwd load-nvmrc
load-nvmrc

#------------Prompt------------

eval "$(starship init zsh)"

[[ "$TERM" == "kaku" && -f "/Users/khoirul/.config/kaku/zsh/kaku.zsh" ]] && source "/Users/khoirul/.config/kaku/zsh/kaku.zsh" # Kaku Shell Integration
