# Dotfiles by OS

Clone this repo and point your config files at it so you can `git pull` and keep getting updates, instead of copy/pasting static snippets. Dotfiles are organized per platform so you can install only what you need.

## Layout
- `windows/`: Git config, global gitignore, gitattributes, editorconfig, PowerShell profile, and `.gitconfig.local.example`.
- `linux/`: A lightweight `.bashrc` starter with a few aliases and history tweaks.
- `macos/`: A lightweight `.zshrc` starter with aliases and Homebrew path loading.

## Windows setup (PowerShell)
1) Clone the repo:
```pwsh
git clone https://github.com/steve/dotfiles.git $HOME\dotfiles
Set-Location $HOME\dotfiles
```

2) Symlink the dotfiles from the Windows directory so updates flow automatically:
```pwsh
$home = $env:USERPROFILE
New-Item -ItemType SymbolicLink -Path $home\.gitconfig -Target (Resolve-Path windows/.gitconfig) -Force
New-Item -ItemType SymbolicLink -Path $home\.gitconfig.local -Target (Resolve-Path windows/.gitconfig.local.example) -Force   # edit this with your info
New-Item -ItemType SymbolicLink -Path $home\.gitignore_global -Target (Resolve-Path windows/.gitignore_global) -Force
New-Item -ItemType SymbolicLink -Path $home\.gitattributes -Target (Resolve-Path windows/.gitattributes) -Force
New-Item -ItemType SymbolicLink -Path $home\.editorconfig -Target (Resolve-Path windows/.editorconfig) -Force
```

If symlinks are blocked (for example, if Developer Mode is off), copy instead:
```pwsh
Copy-Item windows/.gitconfig "$home\.gitconfig" -Force
Copy-Item windows/.gitconfig.local.example "$home\.gitconfig.local" -Force
Copy-Item windows/.gitignore_global "$home\.gitignore_global" -Force
Copy-Item windows/.gitattributes "$home\.gitattributes" -Force
Copy-Item windows/.editorconfig "$home\.editorconfig" -Force
```

3) Add your actual Git identity in the local override:
Edit `$home\.gitconfig.local` that you just created.

4) Install the PowerShell profile (it will start new shells in `$env:USERPROFILE\github` if that folder exists):
```pwsh
$profileDir = Split-Path $PROFILE
New-Item -ItemType Directory -Path $profileDir -Force | Out-Null
New-Item -ItemType Directory -Path "$env:USERPROFILE\github" -Force | Out-Null
Copy-Item windows/Microsoft.PowerShell_profile.ps1 $PROFILE -Force
Set-ExecutionPolicy -Scope CurrentUser RemoteSigned   # allows the profile to run
```

5) (Optional) Install `posh-git` for a richer prompt:
```pwsh
Install-Module posh-git -Scope CurrentUser
```

Keep the repo around and run `git pull` occasionally to grab updates, then open a new PowerShell session.

## Linux setup (Bash)
1) Clone the repo and change into it.
2) Symlink the starter Bash profile so updates pull through (copy if you prefer a static file):
```bash
ln -sf "$(pwd)/linux/.bashrc" ~/.bashrc
# or: cp linux/.bashrc ~/.bashrc
```
3) Add any machine-specific tweaks in `~/.bashrc.local` (loaded automatically if it exists).
4) Keep the repo and run `git pull` occasionally to receive updates.

## macOS setup (Zsh)
1) Clone the repo and change into it.
2) Symlink the starter Zsh profile so updates pull through (copy if you prefer a static file):
```bash
ln -sf "$(pwd)/macos/.zshrc" ~/.zshrc
# or: cp macos/.zshrc ~/.zshrc
```
3) Add any machine-specific tweaks in `~/.zshrc.local` (loaded automatically if it exists).
4) Keep the repo and run `git pull` occasionally to receive updates.
