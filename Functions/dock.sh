function dock {
	if [[ "$1" = "--help" || "$1" = "-h" ]]; then
		echo -e "
dock: Run a single serving docker image
‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾
If you do not pass an image name, I'll suggest a couple for you

dock [image] [nickname]

> Examples:
$ dock node:lts-alpine evil-node
$ dock node:lts-alpine
$ dock
"
		return
	fi

	local image=$1
	if [ -z "$image" ]; then
		echo "You did not specify an image, You can pick one of these:"
		local images=()
		images+=('ubuntu')
		images+=('node:lts-alpine')
		images+=('ruby:latest')
		images+=('Quit')
		select image in "${images[@]}";
		do
			if [ -z $image ]; then
				return
			elif [ $image == "Quit" ]; then
				return
			else
				break
			fi
		done
	fi

	local name=$2
	: ${name:="dock${RANDOM}"}
	echo "Gonna run $image as $name"
	docker run -it -d --name $name $image
	docker exec -it $name /bin/sh
	echo "Stopping $image, don't close this process"
	docker stop $name
	docker rm $name
}
