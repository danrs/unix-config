# alias shortcuts for ls
alias ll='ls -l'
alias la='ls -la'

#ipython alias
alias py="ipython"
alias gti="git"

# make grep coloured
alias grepc='grep --color=always'

# osx colour stuff
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

# set up a nice prompt with git integration
export GITAWAREPROMPT=~/.bash/git-aware-prompt
source "${GITAWAREPROMPT}/main.sh"
export PS1="\u:\W \[$txtcyn\]\$git_branch\[$txtred\]\$git_dirty\[$txtgrn\]\$\[$txtrst\] "

# set up git tab-completion
if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

# set up bash history
export HISTSIZE=10000
export HISTFILESIZE=10000
export HISTTIMEFORMAT="%h %d %H:%M:%S "

# set default editor
export EDITOR=vim

# set up nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
