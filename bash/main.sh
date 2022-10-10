# . /vo/wo/vorishirne/bash/main.sh
export basedirpath=/vo
export allpath=$basedirpath/wo
export bashdir=$allpath/vorishirne/bash
export dump=$allpath/dump
export hdir=$basedirpath/ho

export EDITOR=nano

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
  . $bashdir/rand_utils.sh
  . $bashdir/path.sh
  . $bashdir/editor.sh
  . $bashdir/k8.sh
  . $bashdir/temp.sh
  . $bashdir/handy.sh
  . $bashdir/command.sh
  . $bashdir/aws.sh
  . $bashdir/dev.sh
  . $bashdir/program/android.sh
  . $bashdir/program/go.sh

  # lets use negate in wildcards
  # ls ../scripts/!(k*).sh
  shopt -s extglob  # Enables extglob
else
  echo -n bash already loaded $bash_loaded
fi

export kindconfig="/vo/wo/repository/k8s-exps/env/kind/kind-config.yaml"
export org=$allpath"/repository/aaorg"
export guide=$allpath"/vorishirne/guide"
bash_loaded=1

