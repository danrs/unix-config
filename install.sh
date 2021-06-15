#!/bin/bash

echo "Installing tools"
sudo apt install -y vim git zsh

# This repo holds all my unix config files
if [ $1 = "-f" ]
then
    FORCE_LINK="-f"
    echo FORCE LINKING
fi
echo "Symlinking configs to home directory:"
ln -s $FORCE_LINK ~/unix-config/git/.[!.]* ~
ln -s $FORCE_LINK ~/unix-config/vim/.[!.]* ~
ln -s $FORCE_LINK ~/unix-config/zsh/.[!.]* ~
ln -s $FORCE_LINK ~/unix-config/bash/.[!.]* ~

echo "Setting up zsh as default shell"
chsh -s $(which zsh)
zsh zsh/.zim/zimfw.zsh install

echo "To install vim plugins, open vim and run"
echo ":PlugInstall"

# make ctrl+tab change tab in gnome terminal
echo "Checking for gnome settings to update terminal controls:"
which gsettings && \
gsettings set org.gnome.Terminal.Legacy.Keybindings:/org/gnome/terminal/legacy/keybindings/ next-tab '<Primary>Tab' && \
gsettings set org.gnome.Terminal.Legacy.Keybindings:/org/gnome/terminal/legacy/keybindings/ prev-tab '<Primary><Shift>Tab'
