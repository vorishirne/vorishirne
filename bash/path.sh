syspath="$PATH"

binpath="\
:/snap/bin\
:/usr/local/go/bin\
:$HOME/.pub-cache/bin\
:$readonlypath/bin/binaries\
"
scriptspath="" #populate via script

programspath="\
:$readonlypath/bin/framework/flutter/bin\
:$readonlypath/bin/framework/android\
"
export PATH=$PATH$binpath$scriptspath$programspath

