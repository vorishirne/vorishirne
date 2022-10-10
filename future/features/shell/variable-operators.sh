#bash -e features/shell/variable-operators.sh
. features/shell/helpers/helper.sh

length_operator() {
	STR="a b c"
	LIST=(01 2 3 4 5 6 7 8 9)
	echo "len of value of string ${#STR}"
	echo "len of array (if this var is treated like an array) ${#STR[@]}"
	echo
	echo "len of first value of this array ${#LIST}"
	echo "len of array ${#LIST[@]}"
}

value_check_operators() {
	a=p
	echo -e "a=p"
	b=""
	echo -e "b=\"\""
	c=
	echo -e "c="
	echo -e "d never came"

	gap ":-"
	echo -e "\n if don't has a value, then use this value"
	echo '{a:-q}'" => ${a:-q}"
	echo '{b:-q}'" => ${b:-q}"
	echo '{c:-q}'" => ${c:-q}"
	echo '{d:-q}'" => ${d:-q}"

	gap ":+"
	echo -e "\n# if has a value, then use this value"
	echo '{a:+q}'" => ${a:+q}"
	echo '{b:+q}'" => ${b:+q}"
	echo '{c:+q}'" => ${c:+q}"
	echo '{d:+q}'" => ${d:+q}"

	gap "-"
	echo -e "\n# if unset, then use this value"
	echo '{a-q}'" => ${a-q}"
	echo '{b-q}'" => ${b-q}"
	echo '{c-q}'" => ${c-q}"
	echo '{d-q}'" => ${d-q}"

	gap "+"
	echo -e "\n# if set then use this value"
	echo '{a+q}'" => ${a+q}"
	echo '{a+q}'" => ${b+q}"
	echo '{c+q}'" => ${c+q}"
	echo '{d+q}'" => ${d+q}"
}


"$@"
