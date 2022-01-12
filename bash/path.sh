syspath="$PATH"

binpath="\
:/snap/bin\
:~/.local/bin\
:/usr/local/go/bin\
:$HOME/.pub-cache/bin\
:$allpath/bin/binaries\
"
scriptspath="" #populate via script

programspath="\
:$allpath/bin/framework/flutter/bin\
:$allpath/bin/framework/android\
"
export PATH=$PATH$binpath$programspath$scriptspath

