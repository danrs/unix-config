#!/bin/bash

which -s brew
if [[ $? != 0 ]] ; then
    echo "Installing homebrew..."
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
    echo "Updating brew..."
    brew update
fi

echo "Installing CLI tools..."
brew install \
    rg \
    fzf \

echo "Installing casks..."
brew install --cask \
    1password \
    firefox \
    gimp \
    iterm2 \
    itsycal \
    keyboard-maestro \
    raycast \
    vlc \
    warp \
    zoom \
    #google-chrome \
    #beyond-compare \
    #discord \
    #inkscape \
    #openvpn-connect \
    #slack \
    #steam \
    #visual-studio-code \

