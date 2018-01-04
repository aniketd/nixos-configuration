#!/usr/bin/env fish
cd ~
mkdir -p ~/.tmux/plugins
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
ln -sr ~/Code/nixos-configuration/dotfiles/tmux.conf ~/.tmux.conf
echo "ATTENTION: First `tmux source ~/.tmux.conf` and then PREFIX-I (CTRL-b I) to install plugins."
