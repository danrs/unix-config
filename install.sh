#!/bin/bash

echo "Installing tools"
sudo apt install vim git zsh

# This repo holds all my unix config files
echo "Symlinking configs to home directory:"
rm ~/.bashrc
ln -s ~/unix-config/git/.[!.]* ~
ln -s ~/unix-config/vim/.[!.]* ~
ln -s ~/unix-config/zsh/.[!.]* ~
ln -s ~/unix-config/bash/.[!.]* ~

echo "Setting up zsh as default shell"
chsh -s $(which zsh)
zsh zsh/.zim/zimfw.zsh install

#echo "installing git-aware-prompt"
#mkdir -p  ~/.bash
#git clone git://github.com/jimeh/git-aware-prompt.git ~/.bash/git-aware-prompt

echo "To install vim plugins, open vim and run"
echo ":PlugInstall"

# make ctrl+tab change tab in gnome terminal
echo "Checking for gnome settings to update terminal controls:"
which gsettings && \
gsettings set org.gnome.Terminal.Legacy.Keybindings:/org/gnome/terminal/legacy/keybindings/ next-tab '<Primary>Tab' && \
gsettings set org.gnome.Terminal.Legacy.Keybindings:/org/gnome/terminal/legacy/keybindings/ prev-tab '<Primary><Shift>Tab'
