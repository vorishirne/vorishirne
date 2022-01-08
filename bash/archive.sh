# to change default acl for a dir
chacl -r u::rwx,g::r-x,o::r-- ./


# this can print the line number of the found item, let's say, find the index of the terminal to be set default
sudo update-alternatives  --list x-terminal-emulator | grep -n qterminal  | awk -F: '{printf $1}'
# -n here prints the line no. matched


#will get you the arguments starting with "$3". 
"${@:3}"
# will get you up to four arguments starting at "$3" (i.e. "$3" "$4" "$5" "$6"), if that many arguments were passed.
"${@:3:4}" 
# gives number of args
"$#"

# will give this PS1
# pkv@INCT-PrashantKumar /home/pkv/sys/r/goreader in master
# ▶ (green blinking)
export PS1="\[\033[3;32m\]\u\[\033[m\]@\[\033[4;33m\]\H\[\033[m\] \[\033[2;34m\]\$(pwd)\[\033[m\]\$(__git_ps1 '\[\033[2;32m\] in \[\033[m\]\[\033[4;36m\]%s\[\033[m\]')\n\[\033[5;36m\]▶\[\033[m\] "

# for rotating a command through all the args
# and execute other based on some condition
# 
ok () 
{ 
    for arg in "$@"; # the in "$@" got appended automatically
    do
        cat $arg | grep --color=auto -qe ".eks.amazonaws.";
        if [ $? == "0" ]; then
            echo $arg;
            nok $arg;
        fi;
    done
}

nok () 
{ 
    echo "-------------------------" $1 && echo && echo;
    k8 ${1#config-};
    kubectl get po -A
}

# copy a bkp of whole os, with right permissions
sudo cp -a ../d82f753a-0e97-46f3-8887-d0c5b95c3662/ ./u21.20-bkp/fresh/

