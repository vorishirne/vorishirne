# codes are given like this \[\e[ code \] , because of some programming purpose i don't know
# code is like x;3y;4ym
# x is for underline blink and stuff
# 3y is for text color
# 4y is for bg color
# https://makandracards.com/makandra/1090-customize-your-bash-prompt

PS1="\[\033[1;37;42m\]\$(id -u) \$EXIT_CODE\[\033[m\]\[\033[5;33m\]\$(night-lamp)\[\033[m\]"

# set the terminal name content 
# why not with ideal PROMPT_COMMAND is because it is overriden via PS1 as PS1 is applied by bash after PROMPT_COMMAND.
# and if some bashrc has updated PS1, then it will be counted.
# but in below case, our part of PS1 executes even more late
PS1="\[\033]0;$HOSTNAME: ""\$(short-path)""\007\]$PS1" 
# \007 can be replaced with \a, which is the first non printing char. Named as BEL char
# \033 can be replaced with \e, which is the escape char. Named as ESC char
# ] after the escape sequences(not escape char), means to receive a command
# 0; means change name and icon
# 1; means change icon # no
# 2; means change name # not works in qterminal, but does in xterm and genome-terminal

# echo -e '\[\e]0;tname\a\]' in prompt command sets terminal name, but i use it to add spaces after commands
PROMPT_COMMAND='
EXIT_CODE=$?
echo
echo
'
alias sudo="sudo "

function night-lamp {  
   currenttime=$(date +%H:%M)
   if [[ "$currenttime" > "22:00" ]] || [[ "$currenttime" < "03:00" ]]; then
	echo -e '\U1F319'
   elif [[ "$currenttime" > "17:00" ]] ; then
     echo -e '\U1FA94'
   else 
     echo " "
   fi
}

function short-path {
	sed -e "s:^$HOME:~:" \
	-e "s:^/vorishirne/vorishirne/all:+:" \
	-e "s:^/vorishirne/vorishirne:*:" \
	 <<< $PWD
}
# blinking underscore cursor
echo -en "\e[3 q" ;


if [ "$PWD" = "$HOME" ] ; then
  cd "$(cat $bashdir/cwd)"
fi
export CWD=$(cat $bashdir/cwd)

function cwd {
	echo "$1" > $bashdir/cwd
	cd "$1"
}

#function Sudo {
#        local firstArg=$1
#        if [ $(type -t $firstArg) = function ]
#        then
#                shift && command sudo bash -c "$(declare -f $firstArg);$firstArg $*"
#        elif [ $(type -t $firstArg) = alias ]
#        then
#                alias sudo='\sudo '
#                eval "sudo $@"
#        else
#                command sudo "$@"
#        fi
#}


#f ()
#{
#    x="a b";
#    menu "$x";
#    y="difficult thing";
#    echo "a $y to parse";
#}
#
#menu ()
#{
#    [ "$1" == "a b" ] &&
#    echo "here's the menu";
#}
#
#cat <<EOS | sudo bash
#$(declare -f f)
#$(declare -f menu)
#f
#EOS