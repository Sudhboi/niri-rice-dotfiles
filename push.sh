#!/bin/zsh

echo "Enter Commit Message: "
read commit_message

export DOTFILES="/home/sudhirk/.backups/dotfiles"


cp -r ~/.config/niri $DOTFILES/.config
cp -r ~/.config/btop $DOTFILES/.config
cp -r ~/.config/cava $DOTFILES/.config
cp -r ~/.config/fastfetch $DOTFILES/.config
cp -r ~/.config/hypr $DOTFILES/.config
cp -r ~/.config/kitty $DOTFILES/.config
cp -r ~/.config/mako $DOTFILES/.config
cp -r ~/.config/nvim $DOTFILES/.config
cp -r ~/.config/rofi $DOTFILES/.config
cp -r ~/.config/tmux $DOTFILES/.config
cp -r ~/.config/waybar $DOTFILES/.config
cp -r ~/.config/yazi $DOTFILES/.config


cd $DOTFILES

git add -A

git commit -m $commit_message
git push -u origin main

