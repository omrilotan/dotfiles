function bin {
	read -p "what is the alias you'd like? " NAME
	read -p "where is the file you'd like to link to? " FILE
	read -p "Create command \"${NAME}\" for absolut path \"$(pwd -P)/${FILE}\" (y/n)" -n 1 -r BOOL
	echo ""
	if [[ $BOOL =~ ^[Yy]$ ]]
	then
		echo "create"
		eval "ln -s $(pwd -P)/${FILE} ~/bin/${NAME}"
	else
		echo "abort"
	fi
}
