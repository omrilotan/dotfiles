function es {
	case "$1" in
		"edit")
			eval "edit ~/dotfiles/.templates/espanso.yml"
			return
			;;
		"update")
			# cat ~/dotfiles/.templates/espanso.yml > ~/Library/Preferences/espanso/default.yml
			cat ~/dotfiles/.templates/espanso.yml > $(espanso path config)/default.yml
			if [[ -f ~/dotfiles/.templates/.espanso.yml ]]; then
			    cat ~/dotfiles/.templates/.espanso.yml >> $(espanso path config)/default.yml
			fi
			return
			;;
		"list")
			espanso match list
			return
			;;
		"help")
			echo "Usage:
⎺⎺⎺⎺⎺⎺
$ es <argument>

Possible arguments:
⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺
edit) Edit espanso template
update) Update espanso file to match the template
list) List available matches

And espanso cmd has more options:
⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺"
			echo -e "$(espanso cmd --help)"
	esac
		eval "espanso $@"
}
