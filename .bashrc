if [ uname == 'Linux' ]
then
    # fix linux ls colors
    alias ls='ls --color=auto'

    # set up bash completion
    source /usr/share/bash-completion/completions/git
    # if not working, run `sudo apt-get install git-core bash-completion`
elif [ uname == 'Darwin' ]
then
    # osx colour stuff
    export CLICOLOR=1
    export LSCOLORS=ExFxCxDxBxegedabagacad
    alias ls='ls -G'

    # set up bash completion
    brew install bash-completion # use bash-completion@2 for $BASH_VERSION > 4
    [[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"
fi

alias ll='ls -l'
alias la='ls -la'
alias py="ipython"
alias gti="git"

# make grep coloured
alias grep='grep --color=auto'

# set up a nice prompt with git integration
# TODO find a faster version and/or switch to zsh
export GITAWAREPROMPT=~/.bash/git-aware-prompt
source "${GITAWAREPROMPT}/main.sh"
export PS1="\u:\W \[$txtcyn\]\$git_branch\[$txtred\]\$git_dirty\[$txtgrn\]\$\[$txtrst\] "

# set up bash history
export HISTSIZE=10000
export HISTFILESIZE=10000
export HISTTIMEFORMAT="%h %d %H:%M:%S "

# set default editor
export EDITOR=vim

# set up nvm
# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
