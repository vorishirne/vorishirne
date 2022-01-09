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


function resor {
 	bash_loaded=
	. $bashdir/main.sh
}
