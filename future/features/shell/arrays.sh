#!/bin/bash
#bash -e features/shell/arrays.sh
. helpers/scripts/helper.sh

loop_an_array() {
	LIST=(1 2 3)
	echo right way to use an array
	for i in "${LIST[@]}"; do
		echo "example.$i"
	done
	#-1

	echo stringifying entire array
	# shellcheck disable=SC2066
	for i in "${LIST[*]}"; do
		echo "example.$i"
	done
	#-3
}

create_an_array_and_use() {
	BB="b b nn"
	# shellcheck disable=SC2206
	LIST=("a" a 0 0 "0 0" $BB "$BB")
	for i in "${LIST[@]}"; do
		echo "example.$i"
	done
	#-1

	ARR1=("0 1" 2 "3 9" 4 5 6 7)
	# shellcheck disable=SC2068
	echo array ${ARR1[@]}
	# shellcheck disable=SC2128
	echo array as usual variable ${ARR1}
	#-2

	# this is not slicing, its segmenting
	# give two elements from index 0 and 3
	echo array indexing ${ARR1[@]:0:2}
	echo array indexing ${ARR1[@]:3:2}
	# give elements from index 2
	echo array indexing ${ARR1[@]:2}
	# out of bound case
	echo len ${#ARR1[@]}
	echo array bound out ${ARR1[@]:6:2}
	echo array bound out ${ARR1[@]:7:2}
	#-3

	echo len ${#ARR1[@]}
	# len of 1st element of array
	echo len ${#ARR1}
	#-4
}

array_iteration_and_quotes() {
	LIST=(1 3 "4 5")

	# array "A[@]" in `("$A[@]")` or `for i in "$A[@]"; do`
	# means
	# ("$A[0]" "$A[1]" "$A[2]") or ("1" "3" "4 5")
	# un intuitive
	echo copy array with quotes
	NEW_LIST=("${LIST[@]}" 0 0 "0 0")
	for i in "${NEW_LIST[@]}"; do
		echo "example.$i"
	done
	#-1

	# array A[@] in `($A[@])` or `for i in $A[@]; do`
	# means
	# ($A[0] $A[1] $A[2]) or (1 3 4 5) as without quotes, string is expanded
	echo expand array without quotes in array creater brackets \(\)
	# shellcheck disable=SC2206
	NEW_LIST=(${LIST[@]} 0 0 "0 0") # here
	for i in "${NEW_LIST[@]}"; do
		echo "example.$i"
	done
	#-2

	echo expand array without quotes in for loop
	NEW_LIST=("${LIST[@]}" 0 0 "0 0")
	# shellcheck disable=SC2068
	for i in ${NEW_LIST[@]}; do # now here
		echo "example.$i"
	done
	#-3

	#
	# beware, this not array expansion,
	# this is string conversion, then array conversion
	NEW_LIST=(${LIST[*]})
	#-4

	# then what does "asA[@]" mean?
	# "asA[0]" "A[1]" "A[2]"
	a=("sd df" "ok sd")
  set -x
  # shellcheck disable=SC2145
  echo "bhajji ${a[@]}" > /dev/null
  set +x
  # + echo 'bhajji sd df' 'ok sd'
	#-5
}

array_and_assignment_operator() {
	LIST=(1 2 3)
	# shellcheck disable=SC2178
	LIST=3
	# shellcheck disable=SC2179
	LIST+=4
	LIST+=(5)
	for i in "${LIST[@]}"; do
		echo "example.$i"
	done
}

dollar_is_reserved_array() {
	ARR=(1 2 3 4 5 6 7 8 9 10)
	some_func() {
		echo 1 $
		echo 2 $0
		echo 3 $1
		echo 4 $@
		echo 5 $*
		echo 6 "${@:1:4}"
		echo 7 "$#" "<"
		echo 8 len "${#@}" and last element is ${9} ? "<"
		echo 9 "${@:0:4}"
	}
	some_func "${ARR[@]}"
	echo usual array
	echo 1 $ARR
	echo 2 ${ARR[0]}
	echo 3 ${ARR[1]}
	echo 4 ${ARR[@]}
	echo 5 ${ARR[*]}
	echo 6 "${ARR[@]:1:4}"
	echo 7 "${#ARR}" "<"
	echo 8 len "${#ARR[@]}" and last element is ${ARR[9]} ? "<"

	echo in dollar, array indexing starts from 1, see the len
}

corner_cases() {
	echo how @ it behaves with non arrays
	SOME_STRING="a b c"
	for i in "${SOME_STRING[@]}"; do
		echo "example.$i"
	done
	# shellcheck disable=SC2066
	for i in "${SOME_STRING}"; do
		echo "example.$i"
	done
	#-1

	# () and for i in __ ; are valid expansion syntax for array
	# without them can array be expanded in usual way?
	LIST=(1 2 3)
	# LIST will split up fine, but will not be collected in array, hence defaults to string
	NEW_LIST=${LIST[@]}
	for i in "${NEW_LIST[@]}"; do
		echo "example.$i"
	done

	echo "len of array ${#LIST[@]}"
	echo "len of array (if this var is treated like an array) ${#NEW_LIST[@]}"
	#-2
}

"$@"
