assume() {
	. awsume -s "$1" > /tmp/awssomething
	sed s/export\ // /tmp/awssomething | grep -v AWS_REGION= | grep -v AWS_DEFAULT_REGION= | grep -v AWSUME_PROFILE= | grep -v AWSUME_EXPIRATION=
	echo DYNAMODB__RUNNING_LOCAL_DB=false
	echo DYNAMODB__TABLE_NAME=ncx-auth-pkumar-temp7-20"$2"
}

