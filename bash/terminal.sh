# codes are given like this \[\e[ code \] , because of some programming purpose, i don't know
# code is like x;3y;4zm
# x is for underline, blink and stuff
# y is for text color
# z is for bg color
# missing any of them will just over-ride them via some default
# https://makandracards.com/makandra/1090-customize-your-bash-prompt

PS1="\[\033[1;37;42m\]\$(id -u) \$EXIT_CODE\[\033[m\]\[\033[5m\]\$(night-lamp)\[\033[m\]"

# set the terminal name content 
# why not with ideal PROMPT_COMMAND is because it is overriden via PS1 as PS1 is applied by bash after PROMPT_COMMAND.
# and if some bashrc has updated PS1, which has terminal name set in it, then it will be given more priority, even if PROMPT_COMMAND is set late.
# but in below case, our part of PS1 always overrides whatever be set earlier.
TERMINAL_NAME_='\[\033]0; ${TERMINAL_NAME:-"$HOSTNAME: $(short-path)"} \007\]'
PS1="$TERMINAL_NAME_""$PS1"
# \007 can be replaced with \a. (which is the first non printing char in ASCII). Named as BEL char. Along with ], it marks the end of the command
# \033 can be replaced with \e. (which is the escape char). Named as ESC char
# ] after the escape sequences(not escape char, which is \e), means to receive a command
# [ after the escape sequences, means to receive some css
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
alias sudoi="sudo -i "

# shellcheck disable=SC2142
alias f="awk '{print \$1}'"
# shellcheck disable=SC2142
alias s="awk '{print \$2}'"
# shellcheck disable=SC2142
alias t="awk '{print \$3}'"

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
  parentdirname=$(basename $(dirname $PWD))
  dirname=$(basename $PWD)
  parentdirname=$(sed 's:/::' <<< $parentdirname)
  dirname=$(sed 's:/::' <<< $dirname)
  echo $parentdirname/$dirname
  return
	sed -e "s:^$HOME:~:" \
	-e "s:^/vo/wo:+:" \
	-e "s:^/vo:*:" \
	 <<< $PWD
}

function name {
  TERMINAL_NAME=$1
}

function empty {
  export PS1="$TERMINAL_NAME_""\\\$ "
}
# blinking block cursor
echo -en "\e[1 q" ;


if [ "$PWD" = "$HOME" ] ; then
  cd "$(cat $bashdir/cwd_$HOSTNAME)" || return
fi

CWD=$(cat "$bashdir"/cwd_$HOSTNAME)
export CWD

function cwd {
  cdir="${1:-"$PWD"}"
  cdir="$(realpath "$cdir")"
	echo "$cdir" > "$bashdir"/cwd_$HOSTNAME
  export CWD="$cdir"
}

alias ccd="cd \${CWD}"

[[ $TERMINAL_EMULATOR == JetBrains-JediTerm ]] && empty
