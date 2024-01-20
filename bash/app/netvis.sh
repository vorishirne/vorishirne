ncxsg() {
	assume cp-qaecm
	[ -n $1 ] && echo setting group id x-$1 && k set env deploy/netvis-lightning-ncxsg -c default EVENTS__NCXSG__GROUP=x-$1
  [ -n $2 ] && echo setting image pkv-$2  && k set image deploy/netvis-lightning-ncxsg default=737819302384.dkr.ecr.us-west-2.amazonaws.com/cp-infra-mystack:prashantkumarvarshney-$2
	k scale deploy netvis-lightning-ncxsg --replicas 1
	vis
}

ncxsg-() {
	assume cp-qaecm
	k scale deploy netvis-lightning-ncxsg --replicas 0
}

dp() {
	assume cp-qaecm
	[ -n $1 ] && echo setting group id x-$1 && k set env deploy/netvis-lightning-deviceposture -c default EVENTS__DEVICE_POSTURE__GROUP=x-$1
  [ -n $2 ] && echo setting image pkv-$2  && k set image deploy/netvis-lightning-deviceposture default=737819302384.dkr.ecr.us-west-2.amazonaws.com/cp-infra-mystack:prashantkumarvarshney-$2
	k scale deploy netvis-lightning-deviceposture --replicas 1
	vis
}

dp-() {
	assume cp-qaecm
	k scale deploy netvis-lightning-deviceposture --replicas 0
}

thunder() {
	assume cp-qaecm
  [ -n $1 ] && echo setting image pkv-$1  && k set image deploy/netvis-thunder default=737819302384.dkr.ecr.us-west-2.amazonaws.com/cp-infra-mystack:prashantkumarvarshney-$1
	k scale deploy netvis-thunder --replicas 1
	vis
}

thunder-() {
	assume cp-qaecm
	k scale deploy netvis-thunder --replicas 0
}

push(){
	ecrlogin
	pushd /vo/wo/repository/aaorg/network-visibility
	[ -n $1 ] && echo image tag pkv-$1 &&V=$1 make -C dev/devdata/netvis push
}
