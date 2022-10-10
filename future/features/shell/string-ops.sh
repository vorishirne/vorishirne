# bash -e features/shell/string-ops.sh
. helpers/scripts/helper.sh

string_arithmetic() {
	a=er
	a+=t
	echo a=$a
	# a-=r syntax error
	# a*=3 syntax error
}

string_iteration() {
	LIST="a b c de"
	for i in ${LIST}; do
		echo "example.$i"
	done
	#-1

	echo word splitting with quote wouldnt work
	# shellcheck disable=SC2066
	for i in "${LIST}"; do
		echo "example.$i"
	done
	#-2

	echo in array creation too it needs to follow same rule
	LIST2=(${LIST})
	for i in "${LIST2[@]}"; do
		echo "example.$i"
	done
	LIST2=("$LIST")
	for i in "${LIST2[@]}"; do
		echo "example.$i"
	done
	#-3
}

string_simple_trim() {
	a="pro-priet-pro"
	echo a is "'"$a"'"
	echo ${a#pro}
	echo ${a%pro}
	echo ${a/priet/}
	echo ${a//pro/}
	# echo ${a#pro/pre} # doesn't works
}

string_simple_replace() {
	a="I am am hamburger"
	echo replace one occurence "'"$a"'" : ${a/am/was}
	echo replace all occurences "'"$a"'" : ${a//am/was}
	gap 1

	a="I am hamburger"
	echo replace from the beginning "'"$a"'" : ${a/#am/was}
	a="am I hamburger"
	echo replace from the beginning "'"$a"'" : ${a/#am/was}
	echo unique to see that spaces here dont need slash
	echo replace empty string from the beginning "'"$a"'" : ${a/#/should }
	gap 2

	a="I am hamburger"
	echo replace from the end "'"$a"'" : ${a/%am/was}
	a="I hamburger am"
	echo replace from the end "'"$a"'" : ${a/%am/was}
	echo replace empty string from the end "'"$a"'" : ${a/%/ should}
	end 3
}

string_pattern_replace() {
	# pattern match
	a="you are hamburger."
	echo a is: "'"$a"'"
	echo ? works here like . : ${a/y?/was}
	echo but . does not work: ${a/./was}
	echo "*" means all: ${a/*/was}

	gap 1

	# grouping works, but not character classes
	a="you :: 13 hamburger"
	echo a is: "'"$a"'"
	echo ${a//[0-9]/o}
	echo ${a//[:word:]/o}
	echo ${a//[word]/o}
	echo
	echo dont get decieved by below, its not character class match
	echo just the characters have been replaced
	echo ${a//[:alnum:]/o}
	gap 2
}

"$@"
