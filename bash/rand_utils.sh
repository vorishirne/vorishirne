function alert {
	spd-say -p 100 -t child_female "$1"
	zenity --info --width=900  --text "$1" --title "gaddari kari be" --window-icon=/home/vorishirne/Downloads/moon2.ico --icon-name=network-error --class=br0 2>/dev/null
}



loop() {
	grep_args=$1
	grep=$2
	completed_on=$3
	msg=$4
	shift 4
	for (( ; ; ))
	do
		"$@" | grep "$grep_args" "$grep"
		if [[ "$?" == "$completed_on" ]]
		then
			alert "$msg"
			return 0;
 fi
 done
}