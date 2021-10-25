function editor-launch {
	edt=/vorishirne/all/bin/editor/"$1"/bin/"$1".sh
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

alias harmx="editor-launch pycharm exit"
alias ideax="editor-launch idea exit"
alias golandx="editor-launch goland exit"
alias webstormx="editor-launch webstorm exit"
alias studiox="editor-launch studio exit"


alias harm="editor-launch pycharm stay"
alias idea="editor-launch idea stay"
alias goland="editor-launch goland stay"
alias webstorm="editor-launch webstorm stay"
alias studio="editor-launch studio stay"

alias harmf="harm -e"
alias ideaf="idea -e"
alias golandf="goland -e"
alias webstormf="webstorm -e"
alias studio="studio -e"

