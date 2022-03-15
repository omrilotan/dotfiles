function es {
	case "$1" in
		"edit")
			eval "edit ~/dotfiles/.templates/espanso.yml"
			return
			;;
		"update")
			cat ~/dotfiles/.templates/espanso.yml > $(espanso path config)/config/default.yml
			echo "matches:" > $(espanso path config)/match/base.yml
			cat ~/dotfiles/.templates/espanso-matches.yml >> $(espanso path config)/match/base.yml
			if [[ -f ~/dotfiles/.templates/.espanso.yml ]]; then
			    cat ~/dotfiles/.templates/.espanso.yml >> $(espanso path config)/match/base.yml
			fi

			return
			;;
		"list")
			espanso match list
			return
			;;
		"dir")
			cd "$(espanso path config)"
			return
			;;
		"sub")
			sub "$(espanso path config)"
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
