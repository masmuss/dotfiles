#------------Aliases------------

# Directory listing (eza)
if command -v eza &>/dev/null; then
  alias tree='eza -a --tree --color always --icons --group-directories-first'
  alias ls='eza --color always --icons --group-directories-first'
  alias la='eza -a -l -b --color always --icons --group-directories-first'
  alias ll='eza -l -b --color always --icons --group-directories-first'
else
  alias tree='ls -laR'
  alias la='ls -la'
  alias ll='ls -l'
fi

# Navigation
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias prj='cd ~/project'
alias pprj='cd ~/project/personal'

# Docker
alias compose='docker compose'
alias cup='docker compose up'
alias cdown='docker compose down'

# Git
alias gb="git branch | fzf | xargs git checkout"

# Laravel
alias artisan='php artisan'
alias sail='sh $([ -f sail ] && echo sail || echo vendor/bin/sail)'

# Tools
alias vim='nvim'
alias atg='antigravity'
alias zshconfig='nvim ${ZDOTDIR:-$HOME/.config/zsh}/.zshrc'

# Utilities
alias h='history'
alias ff='fastfetch'
alias y='yazi'

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# Project scaffolding
alias shadcn-init='bunx --bun shadcn@latest init'
alias drizzle-pg-init='bun add drizzle-orm pg dotenv && bun add -D drizzle-kit tsx @types/pg'
alias biome-init='bun add -d @biomejs/biome && bunx --bun biome init'
