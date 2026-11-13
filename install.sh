#!/bin/bash

if [[ "$OSTYPE" == "linux"* ]]; then
  echo "Installing tools"
  sudo apt-get update
  sudo apt-get install -y vim-gtk3 git zsh ripgrep fzf curl tmux git build-essential fd-find bat gh unzip python3-venv kitty

  ln -s $(which fdfind) ~/.local/bin/fd
  ln -s /usr/bin/batcat ~/.local/bin/bat

  # install config
  git clone git@github.com:danrs/nvim.git ~/.config/nvim
  git clone git@github.com:danrs/kitty.git ~/.config/kitty

  # install nvim
  V=$(curl -fsSLo /dev/null -w '%{url_effective}' https://github.com/neovim/neovim/releases/latest | sed 's|.*/||')
  curl -fLo /tmp/nvim.tar.gz https://github.com/neovim/neovim/releases/download/$V/nvim-linux-x86_64.tar.gz
  sudo mkdir -p /opt/nvim
  sudo tar -xzf /tmp/nvim.tar.gz -C /opt/nvim --strip-components=1
  sudo ln -sf /opt/nvim/bin/nvim /usr/local/bin/nvim

  # install font
  mkdir -p ~/.local/share/fonts/NerdFonts/GeistMono
  cd ~/.local/share/fonts/NerdFonts/GeistMono
  curl -fLO https://github.com/ryanoasis/nerd-fonts/releases/latest/download/GeistMono.tar.xz
  tar -xf GeistMono.tar.xz
  rm GeistMono.tar.xz
  fc-cache -f
  cd -

  # make ctrl+tab change tab in gnome terminal
  echo "Checking for gnome settings to update terminal controls:"
  which gsettings &&
    gsettings set org.gnome.Terminal.Legacy.Keybindings:/org/gnome/terminal/legacy/keybindings/ next-tab '<Primary>Tab' &&
    gsettings set org.gnome.Terminal.Legacy.Keybindings:/org/gnome/terminal/legacy/keybindings/ prev-tab '<Primary><Shift>Tab'
elif [[ "$OSTYPE" == "darwin"* ]]; then
  echo "To install apps etc, run brew install script in oxs folder"
fi

echo "Symlinking configs to home directory:"
configs=(
  git
  tmux
  vim
  zsh
  bash
)

if [ ! -z $1 ] && [ $1 = "-f" ]; then
  FORCE_LINK="-f"
  echo FORCE LINKING
fi
for c in ${configs[@]}; do
  ln -s $FORCE_LINK ~/unix-config/"$c"/.[!.]* ~
done

zsh zsh/.zim/zimfw.zsh install
if [ $SHELL != '/bin/zsh' ]; then
  echo "Setting zsh as default shell"
  echo "disabled for now"
  chsh -s $(which zsh)
fi

echo "To install vim plugins, open vim and run"
echo ":PlugInstall"
