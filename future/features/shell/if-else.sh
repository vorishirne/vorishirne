#bash -e features/shell/if-else.sh
. features/shell/helpers/helper.sh

if_command_succeeds() {
	# the return type will be non! -zero
	# as function/script return the status code of last command executed
	br() { sed &>/dev/null; }

	echo \"if\" runs the command, and if exit code is 0, evaluates it as true
	echo its a different syntax, rather than a check condition
	# will give false, as only exit code zero means true, rest everything is false
	if br; then echo "true"; else echo "false"; fi #false
	#-1

	echo \$? =\> 1 is a string, not a command. \"if\" will try to run it
	trap - ERR
	set +e
	br
	if $?; then echo "true"; else echo "false"; fi # this is erroronomous # but false
	trap 'err $LINENO $?' ERR
	set -e
	#-2

	echo -e "\n"beware of the negate operator and the history operator
	if ! br; then echo "true"; else echo "false"; fi #true
	# this is erroronomous # hence defaults to false
	if !br; then echo "true"; else echo "false"; fi
	#-3
}

returned_value_vs_returned_code() {
	br() { echo 1; }                               # return code is actually 0
	if br; then echo "true"; else echo "false"; fi #true
	br() { return 1; }                             # return code is non 0
	if br; then echo "true"; else echo "false"; fi #false
}

different_ways_of_saying_true() {
	if :; then echo "true"; else echo "false"; fi
	if echo 1; then echo "true"; else echo "false"; fi
	# this one is tricky # actually the printed false is not the false condition statement
	if echo false; then echo "true"; else echo "false"; fi
	if true; then echo "true"; else echo "false"; fi
}

relational_operators() {
	if [[ "3" -lt 2 ]]; then echo "true"; else echo "false"; fi   #false
	if [[ "3" -gt "2" ]]; then echo "true"; else echo "false"; fi #true

	if [[ "3" -ne 3 ]]; then echo "true"; else echo "false"; fi #false
	if [[ "3" -eq 3 ]]; then echo "true"; else echo "false"; fi #true

	echo exploring conditional operator
	# what is the rule then
	if [[ "A" -eq "a" ]]; then echo "true"; else echo "false"; fi # true
	if [[ "A" -eq "p" ]]; then echo "true"; else echo "false"; fi # true
	if [[ "P" -eq "a" ]]; then echo "true"; else echo "false"; fi # true
	if [[ "c" -eq "0" ]]; then echo "true"; else echo "false"; fi # true
	if [[ "c" -eq 0 ]]; then echo "true"; else echo "false"; fi   # true
	if [[ "c" -lt "1" ]]; then echo "true"; else echo "false"; fi # true
	if [[ "c" -eq "2" ]]; then echo "true"; else echo "false"; fi # f
	if [[ "c" -gt "3" ]]; then echo "true"; else echo "false"; fi # f
	echo I dont know what it was but it is not worth exploring
}

"$@"
