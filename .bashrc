# alias shortcuts for ls
alias ll='ls -l'
alias la='ls -la'

# make grep coloured
export GREP_OPTIONS='--color=always'

# osx colour stuff
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

# set up a nice prompt with git integration
export GITAWAREPROMPT=~/.bash/git-aware-prompt
source "${GITAWAREPROMPT}/main.sh"
export PS1="\u:\W \[$txtcyn\]\$git_branch\[$txtred\]\$git_dirty\[$txtrst\]\$ "

# set default editor
export EDITOR=vim

