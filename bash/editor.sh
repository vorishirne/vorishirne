function editor-launch {
	edt=/vorishisrne/all/bin/editor/"$1"/bin/"$1".sh
	if [ -f $edt ] ; then	
    $edt ${2:-.} 1>/dev/null 2>&1 & disown ;
    if [ "$2" = "exit" ] ; then
      exit $?
    fi
  else
    echo "$edt" not exist ;
  fi
}

alias harm="editor-launch pycharm exit"
alias idea="editor-launch idea exit"
alias goland="editor-launch goland exit"
alias webstorm="editor-launch webstorm exit"
alias studio="editor-launch studio exit"


alias harm-stay="editor-launch pycharm stay"
alias idea-stay="editor-launch idea stay"
alias goland-stay="editor-launch goland stay"
alias webstorm-stay="editor-launch webstorm stay"
alias studio-stay="editor-launch studio stay"