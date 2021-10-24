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
