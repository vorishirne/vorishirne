alias lsa="ls -al --color=always -h -n --time-style=iso"

alias gitma="git add -A && git commit -am"

function killa {
	# ps aux | grep "$1 $2" 
	# and 
	# ps aux | grep "$@" 
	# are not same: @ splits off even inside of the quotes :0
	# echo echo will take split args and combine them
	ps aux | grep "$(echo $@)" |awk '{print $2}' | xargs -triP sudo kill -9 P
}
function killx {
	ps aux | grep "$(echo $@)" |awk '{print $2}' | xargs -triP sudo kill -9 P
	exit 0
}


function ip4 { 
	ip -4 -o a | awk '{print $2 " " $4}' | grep -v "^lo\s" | grep -oP "\w+\s\d+\.\d+\.\d+\.\d+" ;
}

function ipw {
	ip4 | grep "$1" |grep -oP "\d+\.\d+\.\d+\.\d+"
}
alias ipen="ipw eno1"

function resor {
 	bash_loaded=
	. $bashdir/main.sh
}
