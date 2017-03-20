This repo holds all my unix config files

To set up, symlink all the files and folders in this directory to home directory:
$ cd ~/unix-config
$ ln -s ./.[!.]* ~ #symlink all the hidden files and folders to home directory (but not . or ..)
