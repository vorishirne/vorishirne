# env
bashdir=/vorishirne/all/watergist/bash
exports=$bashdir/temp.sh
export PATH="$PATH\
:/vorishirne/all/bin/framework/flutter/bin\
:/snap/bin\
:/usr/local/go/bin\
:/vorishirne/all/bin/binaries\
"


export PS1="\[\033[0;36m\]\$(id -u)\[\033[m\]\[\033[5;33m\]\$(night-lamp)\[\033[m\]"

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

# blinking underscored cursor
echo -e "\e[3 q";


export EDITOR=gedit


# history file
HISTFILE=$bashdir/.history_bash_0
HISTSIZE=-1
HISTFILESIZE=-1


if [ $PWD = "/home/pkv" ] ; then
  cd /vorishirne/priv/dump 
fi
if [ $PWD = "/home/water" ] ; then
  cd /vorishirne/priv/dump 
fi


# to set terminal name to Hostname and trimmed current dir
PROMPT_COMMAND='echo -e "\033]0;$HOSTNAME@${PWD/#$HOME/\~}\a" && echo'





. $bashdir/editor.sh
. $bashdir/k8.sh
. $bashdir/temp.sh
