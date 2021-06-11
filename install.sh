#!/bin/bash

# This repo holds all my unix config files
echo "Symlinking configs to home directory:"
ln -s ~/unix-config/git/.[!.]* ~
ln -s ~/unix-config/vim/.[!.]* ~
ln -s ~/unix-config/zsh/.[!.]* ~
ln -s ~/unix-config/bash/.[!.]* ~
#rm ~/.git
#rm ~/.gitignore
chsh -s $(which zsh)
zsh zsh/.zim/zimfw.zsh install

#echo "installing git-aware-prompt"
#mkdir -p  ~/.bash
#git clone git://github.com/jimeh/git-aware-prompt.git ~/.bash/git-aware-prompt

echo "To install vim plugins, open vim and run"
echo ":PlugInstall"

# make ctrl+tab change tab in gnome terminal
which gsettings && \
gsettings set org.gnome.Terminal.Legacy.Keybindings:/org/gnome/terminal/legacy/keybindings/ next-tab '<Primary>Tab' && \
gsettings set org.gnome.Terminal.Legacy.Keybindings:/org/gnome/terminal/legacy/keybindings/ prev-tab '<Primary><Shift>Tab'
