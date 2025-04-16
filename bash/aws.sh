assume() {
	. awsume -s "$1" > /tmp/awssomething
	sed s/export\ // /tmp/awssomething | grep -v AWS_REGION= | grep -v AWS_DEFAULT_REGION= | grep -v AWSUME_PROFILE= | grep -v AWSUME_EXPIRATION=
	echo DYNAMODB__RUNNING_LOCAL_DB=false
	echo DYNAMODB__TABLE_NAME=ncx-auth-qa4
}

ecrlogin() {
	#export $(awsudo ecr)
    . awsume cp-ecr
    aws ecr get-login-password | docker login -u AWS --password-stdin https://737819302384.dkr.ecr.us-west-2.amazonaws.com
}


export -f assume ecrlogin

