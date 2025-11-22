# Dotfiles for Windows

A small, Windows-friendly dotfiles set tuned for Git + PowerShell. Use it as-is or as a starting point for your own setup.

## What's here
- `.gitconfig`: sensible Git defaults (LF by default, VS Code as editor, prune on fetch, rerere, aliases, etc.) with placeholders; includes `~/.gitconfig.local` for your real name/email.
- `.gitignore_global`: global ignores for OS cruft, editor artifacts, logs, and `node_modules/` (also ignores `.gitconfig.local`).
- `.gitattributes`: normalizes line endings (LF default; CRLF for PowerShell/CMD scripts) and marks binaries/lockfiles.
- `.editorconfig`: consistent whitespace/newlines (LF, final newline, trim trailing space; 4-space default, 2-space for JSON/YAML/MD).
- `Microsoft.PowerShell_profile.ps1`: PSReadLine tweaks, optional posh-git prompt, git helpers, PATH refresh, handy aliases.

## Get started (PowerShell)
1) Clone the repo:
```pwsh
git clone https://github.com/steve/dotfiles.git $HOME\dotfiles
Set-Location $HOME\dotfiles
```

2) Copy (or symlink) the dotfiles into place. Copying is simplest:
```pwsh
Copy-Item .gitconfig $HOME\.gitconfig -Force
Copy-Item .gitignore_global $HOME\.gitignore_global -Force
Copy-Item .gitattributes $HOME\.gitattributes -Force
Copy-Item .editorconfig $HOME\.editorconfig -Force
```

3) Add your actual Git identity in the local override (keeps personal info out of the repo):
```pwsh
@'
[user]
  name = Your Name
  email = you@example.com
  username = your_github
'@ | Set-Content -Path $HOME\.gitconfig.local -Encoding UTF8
```

4) Install the PowerShell profile:
```pwsh
$profileDir = Split-Path $PROFILE
New-Item -ItemType Directory -Path $profileDir -Force | Out-Null
Copy-Item Microsoft.PowerShell_profile.ps1 $PROFILE -Force
```

5) (Optional) Symlink instead of copy to keep updates in sync:
```pwsh
New-Item -ItemType SymbolicLink -Path $HOME\.gitconfig -Target (Resolve-Path .gitconfig) -Force
New-Item -ItemType SymbolicLink -Path $HOME\.gitignore_global -Target (Resolve-Path .gitignore_global) -Force
New-Item -ItemType SymbolicLink -Path $HOME\.gitattributes -Target (Resolve-Path .gitattributes) -Force
New-Item -ItemType SymbolicLink -Path $HOME\.editorconfig -Target (Resolve-Path .editorconfig) -Force
New-Item -ItemType SymbolicLink -Path $PROFILE -Target (Resolve-Path Microsoft.PowerShell_profile.ps1) -Force
```

6) (Optional) Install `posh-git` for a richer prompt:
```pwsh
Install-Module posh-git -Scope CurrentUser
```

After copying/symlinking, open a new PowerShell session and you’re set.
