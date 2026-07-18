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
alias prj='cd ~/project'
alias pprj='cd ~/project/personal'

# Docker
alias compose='docker compose'
alias cup='docker compose up'
alias cdown='docker compose down'

# Laravel
alias artisan='php artisan'
alias sail='sh $([ -f sail ] && echo sail || echo vendor/bin/sail)'

# Tools
alias vim='nvim'
alias atg='antigravity'
alias zshconfig='nvim $ZDOTDIR/.zshrc'

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

#------------Tool Integrations------------
# fnm
eval "$(fnm env --use-on-cd)"

# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Bun completions
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

# Ruby (chruby)
if [ -f /opt/homebrew/opt/chruby/share/chruby/chruby.sh ]; then
  source /opt/homebrew/opt/chruby/share/chruby/chruby.sh
fi
if [ -f /opt/homebrew/opt/chruby/share/chruby/auto.sh ]; then
  source /opt/homebrew/opt/chruby/share/chruby/auto.sh
fi
if command -v chruby &>/dev/null; then
  if chruby | grep -q "ruby-3.3.5"; then
    chruby ruby-3.3.5
  fi
fi

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

#------------Prompt------------

if command -v starship &>/dev/null; then
  eval "$(starship init zsh)"
fi

# bun completions
[ -s "/Users/khoirul/.bun/_bun" ] && source "/Users/khoirul/.bun/_bun"

# proto
export PROTO_HOME="$HOME/.proto";
export PATH="$PROTO_HOME/shims:$PROTO_HOME/bin:$PATH";
