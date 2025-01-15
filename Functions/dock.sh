function dock {
	if [[ "$1" = "--help" || "$1" = "-h" ]]; then
		echo -e "
🐳 dock: Run a single serving docker image
‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾
If you do not pass an image name, I'll suggest a couple for you

dock [image] [nickname]

> Examples:
$ dock node:lts-alpine evil-node
$ dock node:lts-alpine
$ dock
"
		return
	fi

	if [ -z "$(pgrep -f docker)" ]; then
		echo "docker is not running"
		return
	fi

	local image=$1
	if [ -z "$image" ]; then
		echo "→ You did not specify an image, You can pick one of these:"
		local images=()
		images+=('ubuntu')
		images+=('node:lts-alpine')
		images+=('python:alpine')
		images+=('ruby:alpine') # ruby:latest
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

	local config_files=()
	config_files+=('.aws')
	config_files+=('.gemrc')
	config_files+=('.gitconfig')
	config_files+=('.gradle')
	config_files+=('.jfrog')
	config_files+=('.npmrc')
	config_files+=('.ssh')

	local name=$2
	: ${name:="dock${RANDOM}"}
	echo "→ Run $image as $name"
	echo "docker run --privileged -it -d --rm --volume $PWD:/app --name $name $image"
	docker run --privileged -it -d --rm --volume $PWD:/app --name $name $image
	# docker run --privileged -it -d --rm --volume $PWD:/app --name $name $image
	# docker run --privileged -it -d $PWD:/app --name $name $image
	# docker exec -it $name /bin/sh
	for config_file in "${config_files[@]}"; do
		docker cp ~/$config_file $name:/root/$config_file
	done
	docker exec -it $name /bin/sh
	echo "→ Stop $name ($image), don't close this process"
	docker stop $name
	echo "→ Remove $name ($image)"
	docker rm $name
	echo -e "
Thanks for using dock
                 ‾‾‾‾   🐳
"
}
