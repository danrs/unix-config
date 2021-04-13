Additional Setup (not scripted):
--------------------------------
Program installation:
- keyboard maestro
-- Import macros from global.kmmacros
- iTerm2
-- Install colorschemes by opening them within iterm2 - alienblood is recommended
-- Further schemes available from https://github.com/lysyi3m/osx-terminal-themes
- firefox
- VLC
- 1password
- Itsycal
- homebrew
- slack
- gimp
- parallels (ubuntu 20.04)
-- map ~/workspace from mac to ubuntu vm
-- Disable bell in terminal
-- Set terminal text fg/bg to #007551/#0F1610 (alienblood) TODO makes this an importable config?

Fix Home/End Key Mapping:
Note: this step may be unnecessary with the Home/End remap in keyboard maestro, see how you go
Also, DefaultKeyBindings.dict is ignored by a small number of apps (such as slack)
mkdir ~/Library/KeyBindings
cp DefaultKeyBindings.dict ~/Library/KeyBindings
sudo shutdown now # reboot needed for changes to take effect
