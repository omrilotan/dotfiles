function bin {
	ask NAME "what is the alias you'd like? "
	ask FILE "where is the file you'd like to link to? "
	ask1 BOOL "Create command \"${NAME}\" for absolut path \"$(pwd -P)/${FILE}\" (y/n)"
	echo ""
	if [[ $BOOL =~ ^[Yy]$ ]]
	then
		echo "create"
		eval "ln -s $(pwd -P)/${FILE} ~/bin/${NAME}"
	else
		echo "abort"
	fi
}
