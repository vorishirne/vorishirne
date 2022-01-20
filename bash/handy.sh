alias lsa="ls -al --color=always -h -n --time-style=iso"

alias gitma="git add -A && git commit -am"

function killa {
  ps aux | grep "$*" |awk '{print $2}' | xargs -triP sudo kill -9 P
	#             "$(echo "$@")"
}

function ip4 { 
	ip -4 -o a | awk '{print $2 " " $4}' | grep -v "^lo\s" | grep -oP "\w+\s\d+\.\d+\.\d+\.\d+" ;
}

function ipw {
	ip4 | grep "$1" |grep -oP "\d+\.\d+\.\d+\.\d+"
}

alias grip="history | grep"
function x() {
	# simply writing $1 wouldn't eval an alias as they are evaluated at read time in console
	# shopt -s expand_aliases makes this evaluation in script too, also while sourcing a script, aliases are just ignored as they are not going to be read.
	eval "$1" "${@:2}"
	exit 0
}

function resor {
 	bash_loaded=
	. $bashdir/main.sh
}

