function gap() {
	echo -e "\n=================*$1*====================\n"
	if [[ $1 == "$2" ]]; then
		exit 0
	fi
}

function err {
	echo -e "\nError on line $1"
	echo "exit $2"
	exit $2
}

trap 'err $LINENO $?' ERR

PS4='Line ${LINENO}: '
