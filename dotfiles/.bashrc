#------------------------------------------------------------------#
# File:.bashrc   BASH resource file                            	   #
# Version: N/A	                                                   #
# Author:  Barrington W. Thompson 				   #
#------------------------------------------------------------------#
fortune|cowsay
# ----------------------------------------------------------------------------
# Checks
# ----------------------------------------------------------------------------

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac
# END-Checks -----------------------------------------------------------------

# ----------------------------------------------------------------------------
# Variables
# ----------------
#export ORACLE_HOME=/u01/app/oracle/product/11.2.0/xe
#export ORACLE_SID=xe
#export NLS_LANG=`${ORACLE_HOME}/bin/nls_lang.sh`
#export ORACLE_BASE=/u01/app/oracle
#export LD_LIBRARY_PATH=${ORACLE_HOME}/lib:$LD_LIBRARY_PATH
PYTHONPATH=$HOME/Documents/.virtualenvs/SublimePython/bin:$HOME/Documents/test/PythonTestFiles
PATH=$PATH:$HOME/.local:$HOME/.local/bin:/usr/local/jdk1.8.0_20:/usr/local/jdk1.8.0_20/bin:${ORACLE_HOME}/bin:$PYTHONPATH
EDITOR=vim
TERM=xterm-256color
SHELL=/bin/bash
VIRTUALENVWRAPPER_SCRIPT=/usr/local/bin/virtualenvwrapper.sh
export PATH
export EDITOR
export SHELL

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8

export WORKON_HOME=$HOME/Documents/.virtualenvs
export PROJECT_HOME=$HOME/Documents
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3.4



source $VIRTUALENVWRAPPER_SCRIPT
#don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
#HISTCONTROL=ignoreboth
# append to the history file, don't overwrite it
shopt -s histappend
# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
HISTFILESIZE=2000
HISTFILE=~/.bash_history

# END-Variables --------------------------------------------------------------

# ----------------------------------------------------------------------------
# Alias
#-----------------------------------------------------------------------------

alias ..='cd ..'
alias ..2='cd ../..'
alias ..3='cd ../../..'

#Opens current directory in a file explorer
alias explore='nautilus .'
#Opens current directory in a file explorer with super user privileges
alias gksuexp='gksu nautilus .'
# for when i forget to sudo on a long command
alias sorry='sudo $(history -p \!\!)'
alias sqlplus="rlwrap -i -f ~/.sqlplus_history -H ~/.sqlplus_history -s 30000 sqlplus"

#Opens a GUI text editor in the background. Can obviously be replaced with your favorite editor
alias text='gedit &'
#Same as above with super user privileges
alias sutext='gksudo gedit &'

alias fhere='find -iname'
alias fempty='find ~ -empty'

# Make these commands ask before clobbering a file. Use -f to override.
alias mkdir='mkdir -pv'
alias cp='cp -iv'
alias mv='mv -iv'
alias rm='rm -i'


alias cls='clear'
alias ls='ls -ACshXF --group-directories-first --color=always'
alias ll='ls -AohXrF'

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

alias shutdown='sudo shutdown –h now'
alias restart='sudo shutdown –r now'
alias src='source $HOME/.bashrc'

alias locate='locate -ei'
alias updatedb='sudo updatedb -v'

alias startserver='VBoxHeadless --startvm "UbuntuServer14.04" &'
# list our disk usage in human-readable units including filesystem type,
#and print a total at the bottom
alias df='pydf -ah'
alias free='free -ht'

alias ps='ps auxf' # list process table.
alias psg='ps aux | grep -v grep | grep -i -e VSZ -e'

alias top='htop'
alias du='ncdu -x'
alias wget='wget -cS --progress=dot' # continues download in case of problems

alias vimrc='vim ~/.vimrc'
alias bashrc='vim ~/.bashrc'

alias close='deactivate'

alias add-apt-repository='sudo add-apt-repository --enable-source'
alias apt-get='sudo apt-get'
alias check='sudo apt-get check'
alias agi='sudo apt-get install'
alias agr='sudo apt-get remove --purge'
alias agfi='sudo apt-get -f install'
alias autoremove='sudo apt-get autoremove'
alias bdp='sudo apt-get build-dep'
alias update='sudo apt-get update'
alias upgrade='sudo apt-get upgrade'

alias apt-cache='sudo apt-cache'
alias acs='sudo apt-cache search'
alias acsh='sudo apt-cache show'

alias dpkgs='sudo dpkg -l'

alias oracledb='sudo service oracle-xe start'
alias stopdb='sudo service oracle-xe stop'
# Add an "alert" alias for long running commands.  Use like so:
#  sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

if [ $UID -ne 0 ]; then
    alias reboot='sudo reboot'
fi


#alias aliases='printf "Alias Usage: # for later
# END-Alias ------------------------------------------------------------------

# ----------------------------------------------------------------------------
# Misc
# ----------------------------------------------------------------------------

#Functions
###########################################

function extract {
 if [ -z "$1" ]; then
    # display usage if no parameters given
    echo "Usage: extract <path/file_name>.<zip|rar|bz2|gz|tar|tbz2|tgz|Z|7z|xz|ex|tar.bz2|tar.gz|tar.xz>"
else
    if [ -f $1 ] ; then
        # NAME=${1%.*}
        # mkdir $NAME && cd $NAME
        case $1 in
          *.tar.bz2)   tar xvjf ../$1    ;;
          *.tar.gz)    tar xvzf ../$1    ;;
          *.tar.xz)    tar xvJf ../$1    ;;
          *.lzma)      unlzma ../$1      ;;
          *.bz2)       bunzip2 ../$1     ;;
          *.rar)       unrar x -ad ../$1 ;;
          *.gz)        gunzip ../$1      ;;
          *.tar)       tar xvf ../$1     ;;
          *.tbz2)      tar xvjf ../$1    ;;
          *.tgz)       tar xvzf ../$1    ;;
          *.zip)       unzip ../$1       ;;
          *.Z)         uncompress ../$1  ;;
          *.7z)        7z x ../$1        ;;
          *.xz)        unxz ../$1        ;;
          *.exe)       cabextract ../$1  ;;
          *)           echo "extract: '$1' - unknown archive method" ;;
        esac
    else
        echo "$1 - file does not exist"
    fi
fi
}
# End-Functions

# Prompt
###########################################


# Reset
Color_Off='\e[0m'       # Text Reset

# Regular Colors
Black='\e[0;30m'        # Black
Red='\e[0;31m'          # Red
Green='\e[0;32m'        # Green
Yellow='\e[0;33m'       # Yellow
Blue='\e[0;34m'         # Blue
Purple='\e[0;35m'       # Purple
Cyan='\e[0;36m'         # Cyan
White='\e[0;37m'        # White

# Bold
BBlack='\e[1;30m'       # Black
BRed='\e[1;31m'         # Red
BGreen='\e[1;32m'       # Green
BYellow='\e[1;33m'      # Yellow
BBlue='\e[1;34m'        # Blue
BPurple='\e[1;35m'      # Purple
BCyan='\e[1;36m'        # Cyan
BWhite='\e[1;37m'       # White

# Underline
UBlack='\e[4;30m'       # Black
URed='\e[4;31m'         # Red
UGreen='\e[4;32m'       # Green
UYellow='\e[4;33m'      # Yellow
UBlue='\e[4;34m'        # Blue
UPurple='\e[4;35m'      # Purple
UCyan='\e[4;36m'        # Cyan
UWhite='\e[4;37m'       # White

# Background
On_Black='\e[40m'       # Black
On_Red='\e[41m'         # Red
On_Green='\e[42m'       # Green
On_Yellow='\e[43m'      # Yellow
On_Blue='\e[44m'        # Blue
On_Purple='\e[45m'      # Purple
On_Cyan='\e[46m'        # Cyan
On_White='\e[47m'       # White

# High Intensity
IBlack='\e[0;90m'       # Black
IRed='\e[0;91m'         # Red
IGreen='\e[0;92m'       # Green
IYellow='\e[0;93m'      # Yellow
IBlue='\e[0;94m'        # Blue
IPurple='\e[0;95m'      # Purple
ICyan='\e[0;96m'        # Cyan
IWhite='\e[0;97m'       # White

# Bold High Intensity
BIBlack='\e[1;90m'      # Black
BIRed='\e[1;91m'        # Red
BIGreen='\e[1;92m'      # Green
BIYellow='\e[1;93m'     # Yellow
BIBlue='\e[1;94m'       # Blue
BIPurple='\e[1;95m'     # Purple
BICyan='\e[1;96m'       # Cyan
BIWhite='\e[1;97m'      # White

# High Intensity backgrounds
On_IBlack='\e[0;100m'   # Black
On_IRed='\e[0;101m'     # Red
On_IGreen='\e[0;102m'   # Green
On_IYellow='\e[0;103m'  # Yellow
On_IBlue='\e[0;104m'    # Blue
On_IPurple='\e[0;105m'  # Purple
On_ICyan='\e[0;106m'    # Cyan
On_IWhite='\e[0;107m'   # White

export PS1="\[${BWhite}\]\u\[${White}\]@\[${BGreen}\]\H\[${IPurple}\][\w]\[${White}\]:\\$\[${Color_Off}\]"
# END-Prompt
# END-Misc -------------------------------------------------------------------

