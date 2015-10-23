alias ls='ls --color'
#alias amacs='aquamacs'
#zwc () { command gunzip -c ${@: -1} | wc ${@:1:($#-1)}; }
#zhead () { command gunzip -c ${@: -1} | head ${@:1:($#-1)}; }
source /home/im60/.commands

ish() { command bsub -q interactive -Is bash; }

export IGNOREEOF=5                      # don't log out on Ctrl-D

if [ "$SSH_CONNECTION" = "" ];then
	PS1="\[\033[0;37m\]\W>\[\033[0m\]"
else
	PS1="\[\033[0;37m\]\h:\W>\[\033[0m\]"
fi


#get screen to wokr properly on OSX. 
#From http://code.google.com/p/silassewell/wiki/ScreenOSX
#alias screen='export SCREENPWD=$(pwd); /usr/bin/screen'
#export SHELL='/bin/bash -rcfile ~/.bash_profile';

#Get sweave to work properly
#export SWEAVE_STYLEPATH_DEFAULT="TRUE"

#case "$TERM" in 
#    'screen')
#         cd $SCREENPWD
#         ;; 
#esac

#PATH for nick code and local packages
PATH="/home/im60/bin:/home/np29/bin:${PATH}"
export PATH

#For orchestra
#Set R and java version if we can
hash module 2> /dev/null && module load stats/R/3.1.2 dev/java/jdk1.7 dev/python/3.4.2 dev/python/2.7.6
 
MKL_NUM_THREADS=1
export MKL_NUM_THREADS

#Extended bash syntax
shopt -s extglob

#Save history for ever. Thanks @michaelhoffman
HOSTNAME="$(hostname)"
HOSTNAME_SHORT="${HOSTNAME%%.*}"
HISTFILE="${HOME}/.history/$(date -u +%Y/%m/%d)_${HOSTNAME_SHORT}_$$"
mkdir -p ${HOME}/.history/$(date -u +%Y/%m)
export HISTFILE
HISTSIZE=10000
export HISTSIZE
