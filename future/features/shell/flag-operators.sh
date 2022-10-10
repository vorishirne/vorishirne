#!/bin/bash
#bash -e features/shell/flag-operators.sh
. helpers/scripts/helper.sh

operator_on_variables() {
	a=   # false
	b="" # false
	c=0  # true
	d=1  # true
	e=sd # true
	# unset f # false

	echo a
	if [[ -n $a ]]; then echo "true"; else echo "false"; fi
	if [[ ! -z $a ]]; then echo "true"; else echo "false"; fi
	if [[ -v a ]]; then echo "set"; else echo "unset"; fi

	echo b
	if [[ -n $b ]]; then echo "true"; else echo "false"; fi
	if [[ ! -z $b ]]; then echo "true"; else echo "false"; fi
	if [[ -v b ]]; then echo "set"; else echo "unset"; fi

	echo c
	if [[ -n $c ]]; then echo "true"; else echo "false"; fi
	if [[ ! -z $c ]]; then echo "true"; else echo "false"; fi
	if [[ -v c ]]; then echo "set"; else echo "unset"; fi

	echo d
	if [[ -n $d ]]; then echo "true"; else echo "false"; fi
	if [[ ! -z $d ]]; then echo "true"; else echo "false"; fi
	if [[ -v d ]]; then echo "set"; else echo "unset"; fi

	echo e
	if [[ -n $e ]]; then echo "true"; else echo "false"; fi
	if [[ ! -z $e ]]; then echo "true"; else echo "false"; fi
	if [[ -v e ]]; then echo "set"; else echo "unset"; fi

	echo f
	if [[ -n $f ]]; then echo "true"; else echo "false"; fi
	if [[ ! -z $f ]]; then echo "true"; else echo "false"; fi
	if [[ -v f ]]; then echo "set"; else echo "unset"; fi
	# but -v can't be applied on a function argument or an array
}

path_operators() {

	# to prove, bash follows same evaluation as C on ||
	echo true || echo false

	[[ -f features/shell/flag-operators.sh ]] && echo file exists
	[[ -f features/shell ]] || echo file not exists
	[[ -d features/shell/flag-operators.sh ]] || echo dir not exists
	[[ -d features/shell ]] && echo dir exists
}

"$@"
