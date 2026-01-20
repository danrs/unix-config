#!/bin/bash

if [[ "$OSTYPE" == "linux"* ]]
then
    echo "Installing tools"
    sudo apt install -y vim git zsh ripgrep fzf

    # make ctrl+tab change tab in gnome terminal
    echo "Checking for gnome settings to update terminal controls:"
    which gsettings && \
    gsettings set org.gnome.Terminal.Legacy.Keybindings:/org/gnome/terminal/legacy/keybindings/ next-tab '<Primary>Tab' && \
    gsettings set org.gnome.Terminal.Legacy.Keybindings:/org/gnome/terminal/legacy/keybindings/ prev-tab '<Primary><Shift>Tab'
elif [[ "$OSTYPE" == "darwin"* ]]
then
    echo "To install apps etc, run brew install script in oxs folder"
fi

echo "Symlinking configs to home directory:"
configs=(
    git
    tmux
    vim
    zsh
    #bash
)

if [ ! -z $1 ] && [ $1 = "-f" ]
then
    FORCE_LINK="-f"
    echo FORCE LINKING
fi
for c in ${configs[@]}; do
    ln -s $FORCE_LINK ~/unix-config/"$c"/.[!.]* ~
done

if [ $SHELL != '/bin/zsh' ]
then
    echo "Setting zsh as default shell"
    chsh -s $(which zsh)
    zsh zsh/.zim/zimfw.zsh install
fi

echo "To install vim plugins, open vim and run"
echo ":PlugInstall"

