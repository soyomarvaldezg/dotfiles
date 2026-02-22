# My Dotfiles

Feel free to go through my system dotfiles

## Basics

- For my operating system, I use MacOs.
- For my window manager, I use Aerospace.
- For my terminal, I use Ghostty.
- For my shell, I use Zsh.

## Applications

- For my launcher, I use Raycast.
- For my editor, I use Neovim.
- For my file, manager I use Yazi.
- For my terminal multiplexer, I use Tmux.

## Theme

- For my theme, generally I use tokyonight.
- For terminal font, I use Iosevka Nerd Font.
- For shell prompt, I use oh-my-posh.

# 🚀 Installation

### Option 1 — Fresh Machine (Recommended)

This installs chezmoi and applies the dotfiles in one command:

```
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply YOUR_GITHUB_USERNAME
```

### Option 2 — If Chezmoi Is Already Installed

```
chezmoi init --apply YOUR_GITHUB_USERNAME
```

If your repository **is not named dotfiles**, use:

```
chezmoi init --apply https://github.com/YOUR_GITHUB_USERNAME/YOUR_REPO_NAME.git
```
