#!/bin/bash

# This repo holds all my unix config files
echo "Symlinking unix-config to home directory:"
ln -s ~/unix-config/.[!.]* ~
rm ~/.git
rm ~/.gitignore

echo "installing git-aware-prompt"
mkdir -p  ~/.bash
git clone git://github.com/jimeh/git-aware-prompt.git ~/.bash/git-aware-prompt

echo "To install vim plugins, open vim and run"
echo ":PlugInstall"
