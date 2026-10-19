# Environment & PATH
export PROTO_HOME="$HOME/.proto"
export PATH="$PROTO_HOME/shims:$PROTO_HOME/bin:/opt/homebrew/opt/libpq/bin:$PATH"

#------------Oh-My-Zsh Configuration------------

export ZSH="$HOME/.oh-my-zsh"

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
[[ -f "${ZDOTDIR:-$HOME/.config/zsh}/aliases.zsh" ]] && source "${ZDOTDIR:-$HOME/.config/zsh}/aliases.zsh"

#------------Tool Integrations------------
# fnm
if command -v fnm &> /dev/null; then
  eval "$(fnm env --use-on-cd)"
fi

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
