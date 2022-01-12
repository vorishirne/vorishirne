# . /vorishirne/vorishirne/all/vorishirne/bash/main.sh
export basedirpath=/vorishirne/vorishirne
export allpath=$basedirpath/all
export bashdir=$allpath/vorishirne/bash
export dump=$allpath/dump

export EDITOR=gedit

# history file
HISTFILE=$bashdir/history_bash_1
HISTSIZE=-1
HISTFILESIZE=-1

function x() {
	# simply writing $1 wouldn't eval an alias as they are evaluated at read time in console 
	# shopt -s expand_aliases makes this evaluation in script too, also while sourcing a script, aliases are just ignored as they are not going to be read.
	eval "$1" "${@:2}"
	exit 0
}
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
. $bashdir/program/*.sh


fi

bash_loaded=1
