if [[ "$OSTYPE" == "linux"* ]]
then
    # fix linux ls colors
    alias ls='ls --color=auto'

    # set up bash completion
    source /usr/share/bash-completion/completions/git
    # if not working, run `sudo apt-get install git-core bash-completion`
elif [[ "$OSTYPE" == "darwin"* ]]
then
    # osx colour stuff
    export CLICOLOR=1
    export LSCOLORS=ExFxCxDxBxegedabagacad
    alias ls='ls -G'
fi

alias ll='ls -l'
alias la='ls -la'
alias py="ipython"
alias gti="git"

# make grep coloured
alias grep='grep --color=auto'

# set up a nice prompt with git integration
#export GITAWAREPROMPT=~/.bash/git-aware-prompt
#source "${GITAWAREPROMPT}/main.sh"
#PS1="\u:\W \[$txtcyn\]\$git_branch\[$txtred\]\$git_dirty\[$txtgrn\]\$\[$txtrst\] "
PS1="\u:\W \[$txtgrn\]\$\[$txtrst\] "

# set up bash history
export HISTSIZE=10000
export HISTFILESIZE=10000
export HISTTIMEFORMAT="%h %d %H:%M:%S "

# set default editor
export EDITOR=vim

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
