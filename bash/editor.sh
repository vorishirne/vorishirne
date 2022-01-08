function editor-launch {
	edt=$readonlypath/bin/editor/"$1"/bin/"$1".sh
	args="${@:3}"
	if [ -f $edt ] ; then	
    $edt ${args:-.} 1>/dev/null 2>&1 & disown ;
    if [ "$2" = "exit" ] ; then
      exit $?
    fi
  else
    echo "$edt" not exist ;
  fi
}

alias pycharmx="editor-launch pycharm exit"
alias ideax="editor-launch idea exit"
alias golandx="editor-launch goland exit"
alias webstormx="editor-launch webstorm exit"
alias clionx="editor-launch clion exit"
alias studiox="editor-launch studio exit"
alias datagripx="editor-launch datagrip exit"

alias pycharm="editor-launch pycharm stay"
alias idea="editor-launch idea stay"
alias goland="editor-launch goland stay"
alias webstorm="editor-launch webstorm stay"
alias clion="editor-launch clion stay"
alias studio="editor-launch studio stay"
alias datagrip="editor-launch datagrip stay"

alias pycharmi="pycharm -e"
alias ideai="idea -e"
alias golandi="goland -e"
alias webstormi="webstorm -e"
alias clioni="clion -e"
alias studioi="studio -e"

