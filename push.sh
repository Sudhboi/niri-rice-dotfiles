#!/bin/zsh

echo "Enter Commit Message: "
read commit_message

export DOTFILES="/home/sudhirk/.backups/dotfiles"

function copydir () {
    cp -r ~/.config/$1 $DOTFILES/.config 2>> "/home/sudhirk/.backups/log.txt"
}

copydir niri
copydir btop
copydir cava
copydir fastfetch
copydir hypr
copydir kitty
copydir mako
copydir nvim
copydir rofi
copydir tmux
copydir waybar
copydir zellij

cp -r ~/.zshrc $DOTFILES/.config

cd $DOTFILES

git add -A

git commit -m $commit_message
git push 

echo "\nPrint Log?"
read confirm

if [ "$confirm" = "y" ]; then
    cat "/home/sudhirk/.backups/log.txt"
fi


