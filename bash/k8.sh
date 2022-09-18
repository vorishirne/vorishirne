alias kg="kubectl get"
alias kga="kubectl get-all -o wide"
alias kd="kubectl delete"
alias kds="kubectl describe"
alias kdsp="kubectl describe po"
alias ke="kubectl edit"
alias kesc="kubectl modify-secret"
alias kl="kubectl logs -f"
alias kx="kubectl exec -it"
alias ka="kubectl apply -f"
alias kw="watch kubectl get -o wide"
alias ky="kubectl get -o yaml"

function kxc() {
  # shellcheck disable=SC2068
  kx "$(kubectl get pod -l app="$1" -o jsonpath='{.items[0].metadata.name}')" ${@:2} 
}



UN="-namespaced-knx-"
KUBECONFIG_DIR="$allpath/repository/.kube"
KUBECONFIG="$(cat $bashdir/ckns_$HOSTNAME 2>/dev/null)"
export KUBECONFIG=${KUBECONFIG:-"$HOME/.kube/config"}

function k8() {
  config_name="$1"
  config_dir="${3:-devel}"
  config_ns="${2:-default}"
  export KUBECONFIG="$KUBECONFIG_DIR/$config_dir/$config_name$UN$config_ns"
  echo $KUBECONFIG > $bashdir/ckns_$HOSTNAME
  echo $KUBECONFIG
}

function kcp {
  kubectl config set-context --current --namespace=default
  mkdir -p "$KUBECONFIG_DIR/${2:-devel}"
  cp $KUBECONFIG "$KUBECONFIG_DIR/${2:-devel}/$1${UN}default"
  chmod 600 "$KUBECONFIG_DIR/${2:-devel}/$1${UN}default"
  echo copied to "$KUBECONFIG_DIR/${2:-devel}/$1${UN}default"
}

function kns() {
  KUBECONFIG_="$(sed -e "s:$UN.*::" <<<"$KUBECONFIG")"
  cat $KUBECONFIG >"$KUBECONFIG_""$UN""$1"_dup
  export KUBECONFIG="$KUBECONFIG_""$UN""$1"_dup
  kubectl config set-context --current --namespace=$1

  cat $KUBECONFIG >"$KUBECONFIG_""$UN""$1"
  export KUBECONFIG="$KUBECONFIG_""$UN""$1"
  rm "$KUBECONFIG"_dup

  echo $KUBECONFIG > $bashdir/ckns_$HOSTNAME
  chmod 600 $KUBECONFIG
  export K8_NS="$1"
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

function metall() {
    IP_SET_NUMBER=$1 CLUSTER_NAME=$2 bash -ex $allpath/repository/k8s-exps/env/kind/metallb.sh
}

function kcreate() {
  set -e
  kind delete cluster --name $2
  k8 $2
  kind create cluster --name $2
  metall $1 $2
  set +e
}



