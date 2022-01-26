alias kg="kubectl get"
alias kga="kubectl get-all"
alias kd="kubectl delete"
alias ke="kubectl edit"
alias kesc="kubectl modify-secret"
alias kl="kubectl logs -f"
alias kx="kubectl exec -it"
alias ka="kubectl apply -f"
alias kw="watch kubectl get"
alias ky="kubectl get -o yaml"

alias helm3="helm"

UN="-namespaced-knx-"
KUBECONFIG_DIR="$allpath/repository/.kube"
KUBECONFIG="$(cat $bashdir/ckns 2>/dev/null)"
export KUBECONFIG=${KUBECONFIG:-"$HOME/.kube/config"}

function k8() {
  config_name="$1"
  config_dir="${3:-devel}"
  config_ns="${2:-default}"
  export KUBECONFIG="$KUBECONFIG_DIR/$config_dir/$config_name$UN$config_ns"
  echo $KUBECONFIG > $bashdir/ckns
  echo $KUBECONFIG
}

function kcp {
  kubectl config set-context --current --namespace=default
  mkdir -p "$KUBECONFIG_DIR/${2:-devel}"
  cp $KUBECONFIG "$KUBECONFIG_DIR/${2:-devel}/$1${UN}default"
  echo copied to "$KUBECONFIG_DIR/${2:-devel}/$1${UN}default"
}

function knx() {
  KUBECONFIG_="$(sed -e "s:$UN.*::" <<<"$KUBECONFIG")"
  cat $KUBECONFIG >"$KUBECONFIG_""$UN""$1"
  export KUBECONFIG="$KUBECONFIG_""$UN""$1"
  kubectl config set-context --current --namespace=$1
  echo $KUBECONFIG > $bashdir/ckns
  echo $KUBECONFIG
}

function kunset {
  set -x
  kubectl config unset users.$1
  kubectl config unset clusters.$1
  kubectl config unset contexts.$1
  set +x
}

function krst {
	echo "" > ~/.kube/config
	export KUBECONFIG=~/.kube/config
}
