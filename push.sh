#!/bin/zsh

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

echo "\nPrint Diff?"
read diff

cd $DOTFILES

if [ "$diff" = "y" ]; then
    git diff
fi

echo "Enter Commit Message: "
read commit_message

git add -A

git commit -m $commit_message
git push 

echo "\nPrint Log?"
read confirm

if [ "$confirm" = "y" ]; then
    cat "/home/sudhirk/.backups/log.txt"
fi

rm "/home/sudhirk/.backups/log.txt"


