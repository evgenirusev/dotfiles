[[ $TERM != "screen" ]] && exec tmux

# aliases
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ~="cd ~"
alias -- -="cd -"

alias co="git commit -m"
alias s="git status"
alias c="git checkout $*"
alias a="git add ."
alias r="git reset --hard"
alias rc="git reset --soft HEAD^"
alias cl="git clean -fdx"
alias pu="git pull"
alias po="git pull origin $*"
alias pu="git push"
alias clo="git clone $*"
alias e="start ."
alias i="npm install"
alias vimrc="vim ~/.vimrc"	
alias bashrc="vim ~/.bashrc"	
alias tmuxconf="vim ~/.tmux.conf"	
alias cmd="cmd.exe"	
alias deldir="rm -rf $*"
alias v="vim"
alias onecli="/mnt/d/OneNoteCLI/OneNoteCLI.exe"

# Enable aliases to be sudo’ed
alias sudo='sudo '

# fs
wslPath="/mnt/c/Users/zupso/dev"
alias ds="cd $wslPath/javascript-data-structures-and-algorithms"
alias nodejs="code $wslPath/NodeJSPractice"
alias dev="cd $wslPath"
alias cpr="cd $wslPath/cp"
alias dotfiles="cd $wslPath/dotfiles"
alias sa="vim $wslPath/cp/sandbox/main.cpp"
alias ma="vim $wslPath/cp/competitive-programming/codeforces/main.cpp"
alias codeforces="cd $wslPath/cp/competitive-programming/codeforces"
alias aut="cd $wslPath/scripts-automation-generator"

# utils
function gen() {
    TMPFILE=`mktemp tmp.XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX` &&  echo $TMPFIL
    git add .
    git commit -m "update"
}

function so() {
    source ~/.bashrc
    tmux source-file ~/.tmux.conf
}

function saveDotfiles() {
    local path="$wslPath/dotfiles"

    dotfiles
    rm "$path/.bashrc"
    rm "$path/.tmux.conf"
    rm "$path/.vimrc"

    cp ~/.bashrc $path
    cp ~/.vimrc $path
    cp ~/.tmux.conf $path

    git --git-dir /mnt/c/Users/zupso/dev/dotfiles/.git add .
    git --git-dir /mnt/c/Users/zupso/dev/dotfiles/.git commit -m "update dotfiles"
    git --git-dir /mnt/c/Users/zupso/dev/dotfiles/.git push

    cd -
}

# cp
function res() {
    clear
    g++ "$wslPath/cp/competitive-programming/codeforces/main.cpp" -o /mnt/c/Users/zupso/dev/cp/build/main
    /mnt/c/Users/zupso/dev/cp/build/main
    echo "";
}

function resCustom() {
    clear
    g++ "$wslPath/cp/competitive-programming/codeforces/$1" -o "/mnt/c/Users/zupso/dev/cp/build/main"
    "/mnt/c/Users/zupso/dev/cp/build/main"
    echo "";
}

function createMain() {
    cd "$wslPath/cp/competitive-programming/codeforces"    
    echo "#include <bits/stdc++.h>" >> main.cpp
    echo "using namespace std;" >> main.cpp
    echo "" >> main.cpp
    echo "int main()" >> main.cpp
    echo "{" >> main.cpp
    echo "    " >> main.cpp
    echo "    return 0;" >> main.cpp
    echo "}" >> main.cpp
    cd -
}

function pushSol() {
    cd "$wslPath/cp/competitive-programming/codeforces"
    mv main.cpp "$1.cpp"
    git add .
    git commit -m "add $1"
    git push
    createMain
    cd -
}

# sandbox
function sandbox() {
    clear
    g++ "$wslPath/cp/sandbox/main.cpp" -o /mnt/c/Users/zupso/dev/cp/build/main
    /mnt/c/Users/zupso/dev/cp/build/main
    echo "";
}

export GOPATH=$HOME/go
export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin
export DISPLAY=localhost:0

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #

# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
    *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
        # We have color support; assume it's compliant with Ecma-48
        # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
        # a case would tend to support setf rather than setaf.)
        color_prompt=yes
    else
        color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
    xterm*|rxvt*)
        PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
        ;;
    *)
        ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
    if [ -f /usr/share/bash-completion/bash_completion ]; then
        . /usr/share/bash-completion/bash_completion
    elif [ -f /etc/bash_completion ]; then
        . /etc/bash_completion
    fi
fi
