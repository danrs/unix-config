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

# set up a nice prompt with git integration
#export GITAWAREPROMPT=~/.bash/git-aware-prompt
#source "${GITAWAREPROMPT}/main.sh"
#PS1="\u:\[$txtblu\]\W \[$txtcyn\]\$git_branch\[$txtred\]\$git_dirty\[$txtgrn\]\$\[$txtrst\] "
TXTRED='\[\033[0;91m\]'
TXTGRN='\[\033[0;92m\]'
TXTYLW='\[\033[0;93m\]'
TXTBLU='\[\033[0;94m\]'
BLDBLU='\[\033[1;94m\]'
TXTRST='\[\033[0m\]'

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
# prompt command has to go in a function so it gets called properly each time
function prompt() {
    PS1="\u:$BLDBLU\w$TXTRST $(git_prompt)$TXTGRN\$$TXTRST "

    # fallback prompt - use this if git falls over
    #PS1="\u:\[\e[1;94m\]\w\[$txtrst\] \$ "
    #PS1="\u:$BLDBLU\w$TXTRST $TXTGRN\$$TXTRST "
}
PROMPT_COMMAND=prompt

# set up bash history
shopt -s histappend
export HISTSIZE=10000
export HISTFILESIZE=10000
export HISTTIMEFORMAT="%h %d %H:%M:%S "
export HISTCONTROL=ignoreboth

export EDITOR=vim

# import common aliases
[ -f ~/.alias.sh ] && source ~/.alias.sh

# use ~/.secrets.sh to store env vars that should not be in a repo
[ -f ~/.secrets.sh ] && source ~/.secrets.sh

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
