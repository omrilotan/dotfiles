# ln -s /Applications/Espanso.app/Contents/MacOS/espanso ./.bin/espanso
function es {
	case "$1" in
		"edit")
			eval "edit ~/dotfiles/.templates/espanso.yml"
			return
			;;
		"update")
			local espanso_config_path="$(espanso path config)"
			if [[ ! -d "$espanso_config_path" ]]; then
				echo "Espanso config path does not exist. (${espanso_config_path})"
				exist 1
			fi
			cat ~/dotfiles/.templates/espanso.yml > "${espanso_config_path}/config/default.yml"
			echo "matches:" > "${espanso_config_path}/match/base.yml"
			cat ~/dotfiles/.templates/espanso-matches.yml >> "${espanso_config_path}/match/base.yml"
			if [[ -f ~/dotfiles/.templates/.espanso.yml ]]; then
			    cat ~/dotfiles/.templates/.espanso.yml >> "${espanso_config_path}/match/base.yml"
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
