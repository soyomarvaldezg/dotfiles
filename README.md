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

## Requirements

Ensure you have the following installed on your system

- Git
- Chezmoi

## Installation

First, check out the dotfiles repo in your $HOME directory using git

```
$ git clone git@github.com:soyomarvaldezg/dotfiles.git
$ cd dotfiles
```

then use GNU stow to create symlinks

```
$ stow .
```
