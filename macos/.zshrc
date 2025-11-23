# Powerlevel10k instant prompt (must stay near top)
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Oh-My-Zsh
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)
source "$ZSH/oh-my-zsh.sh"

# Base PATH
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"

# Homebrew paths if available
if command -v brew >/dev/null 2>&1; then
  eval "$(/opt/homebrew/bin/brew shellenv 2>/dev/null || /usr/local/bin/brew shellenv)"
fi

# Local overrides (not committed to Git)
if [ -f "$HOME/.zshrc.local" ]; then
  source "$HOME/.zshrc.local"
fi

# Docker
source "$HOME/.docker/init-zsh.sh" 2>/dev/null || true

# iTerm2
test -e "$HOME/.iterm2_shell_integration.zsh" && source "$HOME/.iterm2_shell_integration.zsh"

# GNU Make
export PATH="$(brew --prefix)/opt/make/libexec/gnubin:$PATH"

# Bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
[[ -s "$HOME/.bun/_bun" ]] && source "$HOME/.bun/_bun"

# Flutter
export PATH="$HOME/GitHub/flutter/bin:$PATH"

# NVM
export NVM_DIR="$HOME/.nvm"
[[ -s "$NVM_DIR/nvm.sh" ]] && source "$NVM_DIR/nvm.sh"
nvm use 18 >/dev/null 2>&1 || nvm use system

# Ruby (RVM last)
export PATH="$HOME/.gem/bin:$HOME/.rvm/bin:$PATH"

# Aliases
alias python='python3'
alias ll='ls -lah'
alias gs='git status -sb'
alias gl='git log --oneline --graph --decorate -20'
alias ytmp4='yt-dlp -f best --recode-video mp4 -o "%(title)s.%(ext)s"'

# Default Editor
export EDITOR="${EDITOR:-code --wait}"

# Powerlevel10k config
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh
