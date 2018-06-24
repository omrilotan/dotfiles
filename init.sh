dots=()
dots+=(path)
dots+=(colours)
dots+=(aliases)
dots+=(functions)
dots+=(prompt)
dots+=(programs)
dots+=(custom)

CHECK_MARK="\033[0;32m\xE2\x9C\x94\033[0m"
for dot in "${dots[@]}"
do
  echo -n "⏳ Processing $dot"
	[[ -s "$HOME/.dotfiles/$dot.sh" ]]      && source "$HOME/.dotfiles/$dot.sh"
	echo -e "\\r${CHECK_MARK} $dot finished   "
done

cd .
