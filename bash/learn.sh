# check if file exists
[ -f /etc/resolv.conf ]
# check if file doesn't exists
[ ! -f /etc/resolv.conf ]
# check if two file exist
[ -f /etc/resolv.conf -a -f /etc/hosts ]
[ -f /etc/resolv.conf ] && [ -f /etc/hosts ]
[[ -f /etc/resolv.conf && -f /etc/hosts ]] # bashy
# same for -d as directory




# check if the given value is set. -v translates to isVariableWithThisNameSet
[ -v OKAA ] && echo "set"
# check if there is something written here. -z translates to isValueEmpty
[ -z "$OKAA" ] && echo "don't has value"



# a=("sd df" "ok sd")

# echo "bhajji ${a[@]}"
# + echo 'bhajji sd df' 'ok sd'

# contrary to the general cases
#echo "bhajji ${a[*]}"
#+ echo 'bhajji sd df ok sd'
#echo ${a[@]}
#+ echo sd df ok sd
# echo ${a[*]}
#+ echo sd df ok sd
