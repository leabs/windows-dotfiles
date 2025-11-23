# Basic Bash profile for Linux

# Prefer VS Code if available; fallback to nano
export EDITOR="${EDITOR:-code --wait}"

# Sensible history and navigation helpers
HISTCONTROL=ignoredups:erasedups
HISTSIZE=5000
HISTFILESIZE=10000

alias ll='ls -lah'
alias gs='git status -sb'
alias gl='git log --oneline --graph --decorate -20'

# Load local overrides if present
if [ -f "${HOME}/.bashrc.local" ]; then
  # shellcheck source=/dev/null
  . "${HOME}/.bashrc.local"
fi
