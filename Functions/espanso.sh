function es {
	case "$1" in
		"edit")
			eval "edit ~/dotfiles/.templates/espanso.yml"
			return
			;;
		"update")
			cat ~/dotfiles/.templates/espanso.yml > $(espanso path config)/default.yml
			return
			;;
	esac
	echo "Usage:
⎺⎺⎺⎺⎺⎺
$ es <argument>

Possible arguments:
⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺
edit) Edit espanso template
update) Update espanso file to match the template"

}

es update
