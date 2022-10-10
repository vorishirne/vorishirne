# bash -e features/shell/functions.sh
. features/shell/helpers/helper.sh

arg_shift() {
	fu() {
		echo $1
		shift
		echo $1
		shift 2
		echo $1
		echo dollar is much like an array
		echo there is a dedicated array comparison of dollar in arrays.sh
	}
	fu 1 2 3 4 5 6 7
}

function_scope() {
	fu() {
		gu() {
			echo gu done
		}
		echo fu done
	}
	set +e
	gu
	set -e
	fu
	gu
}

return_data_from_function() {
	fu() {
		echo some data
	}
	echo data will be sent to console, as it is not received explicitly
	fu
	echo now the data is stored in variable
	a=$(fu)
	echo a = $a
	gap 1

	fu() {
		echo "some data"
		echo another data
		echo one more
	}
	echo returned data is not an array
	a=("$(fu)")
	for i in "${a[@]}"; do
		echo $i
	done
	# shellcheck disable=SC2207
	a=($(fu))
	for i in "${a[@]}"; do
		echo $i
	done
	gap 2
}

"$@"
