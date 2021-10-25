PS1="\[\033[0;36m\]\$(id -u)\[\033[m\]\[\033[5;33m\]\$(night-lamp)\[\033[m\]"

# set the terminal name content 
# why not with ideal PROMPT_COMMAND is because it is overriden via PS1 as PS1 is applied late.
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
PROMPT_COMMAND='echo && echo'

function night-lamp {  
   currenttime=$(date +%H:%M)
   if [[ "$currenttime" > "22:00" ]] || [[ "$currenttime" < "05:00" ]]; then
	echo -e '\U1F319'
   elif [[ "$currenttime" > "17:00" ]] ; then
     echo -e '\U1FA94'
   else 
     echo \ 
   fi
}

function short-path {
	sed -e "s:^$HOME:~:" \
	-e "s:^/vorishirne/all:+:" \
	-e "s:^/vorishirne:*:" \
	 <<< $PWD
}
# blinking underscored cursor
echo -e "\e[3 q";


if [ $PWD = "/home/pkv" ] ; then
  cd /vorishirne/priv/dump 
fi
if [ $PWD = "/home/water" ] ; then
  cd /vorishirne/priv/dump 
fi


