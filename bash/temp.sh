
alias b="xrandr --output DisplayPort-5 --brightness"
#export AWS_PROFILE=power
alias ipl="ipw wlx7cc2c62a51fc"
export PATH="$PATH:/vo/all/dump/istio/istio-1.12.1/bin"

ecrlogin() {
	#export $(awsudo ecr)
    . awsume cp-ecr
    aws ecr get-login-password | docker login -u AWS --password-stdin https://737819302384.dkr.ecr.us-west-2.amazonaws.com
}

dflan(){
  sudo ip route add 192.168.29.0/24 dev eno1 table 3
  sudo ip rule add from all lookup 3
  df2
}

dflan2(){
  sudo ip route add 192.168.29.0/24 dev enxa0cec8fb4342 table 3
  sudo ip rule add from all lookup 3
  df2
}

dflan3(){
  sudo ip route add 192.168.29.0/24 dev wlp0s20f3 table 3
  sudo ip rule add from all lookup 3
  df2
}

df2() {
  sudo ip route add 172.17.0.0/16 dev docker0 src 172.17.0.1 table 1
  sudo ip rule add from all lookup 1
  sudo iptables -t nat -I POSTROUTING -o tun0 -j MASQUERADE
}

#export STACK_NAMESPACE=pkumar-temp7-14014
#export HOMEN=/vo/all/repository/aaorg/istio/exp
#export CONDITIONAL_HOST_MOUNTS="--mount type=bind,source=${HOMEN},destination=${HOMEN},readonly "

function awsunset {
	unset AWS_SESSION_TOKEN AWS_SECRET_ACCESS_KEY AWS_ACCESS_KEY_ID AWS_DEFAULT_PROFILE AWS_PROFILE
}

export ENVOYCD=" -- curl 127.0.0.1:15000/config_dump?type=json"
function ecd() {
  kxc $1 -c ${2:-"$1"} $ENVOYCD
}

alias s="ssh -x vorishirne@11.178.0.142"

function nalog {
	kl -l deploymentName=${1:-ncx-auth-webserver-app-release}
}

alias ncx="goland /vo/wo/repository/aaorg/ncx-auth"
alias kgrip="kg po | grep -i"
alias ngrip="kgrip ncx-auth | grep -v ncx-auth-ui"

function 6w {
docker ps | grep cp-test-6wind | awk '{print $1}'
}


function b2() { (test -n "$(ip4 | grep -w br0)" && test -z "$(nmcli con show | grep -o '^usb0' )" && test -n "$(sysctl -a 2>/dev/null | grep net.bridge.bridge-nf-call-iptables | grep 0)" ) || ( alert "$(ip4)\n\n\n$(nmcli con show)\n\n\n$(sysctl -a 2>/dev/null | grep net.bridge.bridge-nf-call-iptables)\n\n\n sudo sysctl net.bridge.bridge-nf-call-iptables=0; sudo sysctl -p") }



alias redshift="psql postgres://ncxvisibility:Cp-12345@a2fae71a6e7d44663881bcf0f84ad052-823116798.us-west-2.elb.amazonaws.com:45439/ncx_visibility?sslmode=disable"

alias postgres="psql postgresql://netvis:hNFVKOtjr1UG7YgW29fs@a2fae71a6e7d44663881bcf0f84ad052-823116798.us-west-2.elb.amazonaws.com:5440/postgres?sslmode=disable"

stats() {
	pod_name=${1:-"ncxsg"}
	for (( i=100; ;i++ )); do
		echo $i;
		if [[ $i == 100 ]] ; then assume cp-qaecm; i=0; fi
		POD=$(kgrip ${pod_name} | awk '{print $1}' | head -n 1)
		POD=${POD:-"jaat"}
		k top pod --no-headers $POD 2>/dev/null | grep -v "Using json format to get metrics" ; sleep 3; 

	done
}

alias vis='kg po -l group=netvis-k'
alias t='assume cp-qaecm && kl deploy/netvis-thunder'
alias l='assume cp-qaecm && kl deploy/netvis-lightning-ncxsg | grep -e ERROR -e FATAL'

. $bashdir/app/netvis.sh