# . /vorishirne/vorishirne/all/vorishirne/bash/main.sh
export basedirpath=/vorishirne/vorishirne
export allpath=$basedirpath/all
export bashdir=$allpath/vorishirne/bash
export dump=$allpath/dump

export EDITOR=gedit

# history file
HISTFILE=$bashdir/history_bash_2
HISTSIZE=-1
HISTFILESIZE=-1

case "$-" in
 *i*)	
 . $bashdir/terminal.sh
 ;;
esac

if [ "$bash_loaded" != "1" ] ; then
  . $bashdir/vm.sh
  . $bashdir/path.sh
  . $bashdir/editor.sh
  . $bashdir/k8.sh
  . $bashdir/temp.sh
  . $bashdir/handy.sh
  . $bashdir/program/*.sh

  # lets use negate in wildcards
  # ls ../scripts/!(k*).sh
  shopt -s extglob  # Enables extglob
else
  echo -n bash already loaded $bash_loaded
fi

bash_loaded=1
