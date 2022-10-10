#bash -e features/shell/variable-operators.sh
. helpers/scripts/helper.sh

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

evaluate_variable_by_name(){
	v="some value"
	a=v
	echo ${!a}
	gap 1

	echo one application of this is to send an array to a func argument
	fu(){
		 a="$2[@]"
		 b=("${!a}")
		 echo $b ${b[1]}
	}
	arr=(1 "0 3" 4)
	fu a arr
	gap 2

	echo one application of this could be to
	echo detect by variables name, if it is unset
	a=VAR1
	echo "${!a-x}"
	VAR1=coala
	echo "${!a-x}"
	echo however -v would be more convinient way
	gap 3
}

variables_can_not_start_with_integer() {
		a1=a
    echo ${a1}
    1=a
    echo ${1}
}

"$@"
