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

KUBECONFIG_DIR="$HOME/.kube"
export KUBECONFIG="$KUBECONFIG_DIR/config"

#function k8() {
#  config_name="$1"
#  config_dir="${2:-dev}"
#
#  export KUBECONFIG="$KUBECONFIG_DIR/$config_dir/config-$config_name"
#  echo $KUBECONFIG
#}

function knx() {
  UN="-namespaced-knx-"
  KUBECONFIG="$(sed -e "s:$UN.*::" <<< "$KUBECONFIG")"
  cat $KUBECONFIG >"$KUBECONFIG""$UN""$1"
  export KUBECONFIG="$KUBECONFIG""$UN""$1"
  kubectl config set-context --current --namespace=$1
  echo $KUBECONFIG
}
