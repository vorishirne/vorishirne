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

export KUBECONFIG_DIR="$HOME/.kube/configs"
KUBECONFIG="$(cat $bashdir/ckns 2>/dev/null)"
export KUBECONFIG=${KUBECONFIG:-"$HOME/.kube/config"}

function k8() {
  config_name="$1"
  config_dir="${2:-devel}"
  export KUBECONFIG="$KUBECONFIG_DIR/$config_dir/$config_name"
  echo $KUBECONFIG > $bashdir/ckns
  echo $KUBECONFIG
}

function kcp {
  mkdir -p "$KUBECONFIG_DIR/${2:-devel}"
  cp $KUBECONFIG "$KUBECONFIG_DIR/${2:-devel}/$1"
}

function knx() {
  UN="-namespaced-knx-"
  KUBECONFIG="$(sed -e "s:$UN.*::" <<<"$KUBECONFIG")"
  cat $KUBECONFIG >"$KUBECONFIG""$UN""$1"
  export KUBECONFIG="$KUBECONFIG""$UN""$1"
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