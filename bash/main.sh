# env
basedirpath=/vorishirne
readonlypath=$basedirpath/all
bashdir=$readonlypath/vorishirne/bash



export EDITOR=gedit


# history file
HISTFILE=$bashdir/.history_bash_0
HISTSIZE=-1
HISTFILESIZE=-1

. $bashdir/path.sh
. $bashdir/editor.sh
. $bashdir/k8.sh
. $bashdir/temp.sh
. $bashdir/terminal.sh

alias gitma="git add -A && git commit -am"
