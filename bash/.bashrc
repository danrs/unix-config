# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

if [[ "$OSTYPE" == "linux"* ]]
then
    # fix linux ls colors
    alias ls='ls --color=auto'
    export LS_COLORS=$LS_COLORS:'di=1;94:'

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

#TODO move these to a common alias file for both bash and zsh
alias ll='ls -l'
alias la='ls -la'
alias py="ipython"
alias gti="git"
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias rgrep='rgrep --color=auto'

# set up a nice prompt with git integration
#export GITAWAREPROMPT=~/.bash/git-aware-prompt
#source "${GITAWAREPROMPT}/main.sh"
#PS1="\u:\[$txtblu\]\W \[$txtcyn\]\$git_branch\[$txtred\]\$git_dirty\[$txtgrn\]\$\[$txtrst\] "

TXTRED='\[\033[0;91m\]'
TXTGRN='\[\033[0;92m\]'
TXTYLW='\[\033[0;93m\]'
TXTBLU='\[\033[0;94m\]'
TXTRST='\[\033[0m\]'
COLOR_GIT_STAGED='\[\033[0;36m\]'
COLOR_RESET='\[\033[0m\]'

function git_prompt() {
    if git rev-parse --is-inside-work-tree > /dev/null 2>&1; then
    branch_name=$(git symbolic-ref -q HEAD)
    branch_name=${branch_name##refs/heads/}
    branch_name=${branch_name:-HEAD}
    git_status=$(git status --porcelain --ignore-submodules=dirty 2> /dev/null)

    echo -n $TXTGRN$branch_name

    if [[ ! -z "$git_status" ]]; then
        stashed=$(git stash list | wc -l)
        staged=$(echo "$git_status" | grep -c "^[MARCD][ M]")
        unstaged=$(echo "$git_status" | grep -c "^[ M][MARCD]")
        untracked=$(echo "$git_status" | grep -c "^??")
        merge_conflicts=$(echo "$git_status" | egrep -c "^((AA)|(DD)|(.U)|(U.))")
        if [[ "$stashed" -ne "0" ]]; then
            echo -n $TXTGRN' *'"$stashed"
        fi
        if [[ "$merge_conflicts" -ne "0" ]]; then
            echo -n $TXTRED' ~'"$merge_conflicts"
        fi
        if [[ "$staged" -ne "0" ]]; then
            echo -n $TXTYLW' +'"$staged"
        fi
        if [[ "$unstaged" -ne "0" ]]; then
            echo -n $TXTYLW' !'"$unstaged"
        fi
        if [[ "$untracked" -ne "0" ]]; then
            echo -n $TXTBLU' ?'"$untracked"
        fi
    fi

    echo -n $TXTRST" "
  fi
}


export PROMPT_DIRTRIM=4
#TODO colour final command based on prompt success
# promkpt command has to go in a function so it gets called properly each time
function prompt() {
    PS1="\u:\[\e[1;94m\]\w\[$txtrst\] $(git_prompt) \$ "

    # fallback prompt - use this if git falls over
    #PS1="\u:\[\e[1;94m\]\w\[$txtrst\] \$ "
}
PROMPT_COMMAND=prompt

# set up bash history
shopt -s histappend
export HISTSIZE=10000
export HISTFILESIZE=10000
export HISTTIMEFORMAT="%h %d %H:%M:%S "
export HISTCONTROL=ignoreboth


# set default editor
export EDITOR=vim

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
