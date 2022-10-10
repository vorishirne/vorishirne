function editor-launch {
#  set -x
	edt=$allpath/bin/editor/"$1"/bin/"$1".sh
	args=("${@:2}")
	if [ -f "$edt" ] ; then
    "$edt" "${args[@]:-.}" 1>/dev/null 2>&1 & disown ;
  else
    echo "$edt" not exist ;
  fi
#  set +x
}

alias pycharm="editor-launch pycharm"
alias idea="editor-launch idea"
alias goland="editor-launch goland"
alias webstorm="editor-launch webstorm"
alias clion="editor-launch clion"
alias studio="editor-launch studio"
alias datagrip="editor-launch datagrip"

alias pycharmi="pycharm -e"
alias ideai="idea -e"
alias golandi="goland -e"
alias webstormi="webstorm -e"
alias clioni="clion -e"
alias studioi="studio -e"


alias pocket="goland /vo/wo/repository/aaorg/sashi/pocketbase"
