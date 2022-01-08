# . /vorishirne/vorishirne/all/vorishirne/bash/main.sh
basedirpath=/vorishirne/vorishirne
allpath=$basedirpath/all
bashdir=$allpath/vorishirne/bash
dump=$allpath/dump

export EDITOR=gedit

# history file
HISTFILE=$bashdir/history_bash_1
HISTSIZE=-1
HISTFILESIZE=-1

 case "$-" in
 *i*)	
 . $bashdir/terminal.sh
 ;;
esac

# lets use negate in wildcards
# ls !(b*)
shopt -s extglob  # Enables extglob

echo -n $bash_loaded
if [ "$bash_loaded" != "1" ] ; then



. $bashdir/vm.sh
. $bashdir/path.sh
. $bashdir/editor.sh
. $bashdir/k8.sh
. $bashdir/temp.sh
. $bashdir/handy.sh
. $bashdir/program/go.sh



fi

bash_loaded=1
