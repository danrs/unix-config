#!/bin/bash

# This repo holds all my unix config files
echo "Symlinking unix-config to home directory:"
ln -s ~/unix-config/.[!.]* ~
rm ~/.git
rm ~/.gitignore

echo "installing git-aware-prompt"
mkdir ~/.bash
git clone git://github.com/jimeh/git-aware-prompt.git ~/.bash/git-aware-prompt

echo "installing git tab completion"
curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash > .git-completion.bash
ln -s ~/unix-config/.git-completion.bash ~/.git-completion.bash

echo "To install vim plugins, open vim and run"
echo ":PlugInstall"
