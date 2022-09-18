syspath="$PATH"

binpath="\
:/snap/bin\
:~/.local/bin\
:~/go/bin\
:/usr/local/go/bin\
:$allpath/bin/scripts\
:$allpath/bin/binaries\
"
scriptspath="" #populate via script

programspath="\
:$allpath/bin/framework/clang_llvm_14/bin\
:$allpath/bin/framework/flutter/bin\
:$allpath/bin/framework/istio/bin\
:$allpath/bin/framework/android\
:$allpath/bin/framework/postman\
"

applications="\
:$HOME/.krew/bin\
"
export PATH="${PATH}${binpath}${programspath}${applications}${scriptspath}"

