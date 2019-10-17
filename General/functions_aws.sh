aws_mfa() {
	local profile=$1
	local token=$2

	while [[ -z $profile ]]; do
		read -p 'Enter AWS profile name: ' -r profile
	done

	while [[ -z $token ]]; do
		read -p 'Enter your one-time token: ' -r token
	done

	identity="$(aws --profile $profile sts get-caller-identity)"
	account_id="$(jq -r .Account <<< $identity)"
	username="$(jq -r .Arn <<< $identity | cut -d/ -f2)"
	mfa="arn:aws:iam::${account_id}:mfa/${username}"

	credentials="$(aws --profile $profile  sts get-session-token --serial-number $mfa --token-code $token)"

	export AWS_ACCESS_KEY_ID="$(jq  -r .Credentials.AccessKeyId <<< $credentials)"
	export AWS_SECRET_ACCESS_KEY="$(jq -r .Credentials.SecretAccessKey <<< $credentials)"
	export AWS_SESSION_TOKEN="$(jq -r .Credentials.SessionToken <<< $credentials)"
}
