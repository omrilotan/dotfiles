LOADING="⏳"
CHECK_MARK="\033[0;32m\xE2\x9C\x94\033[0m"

dots=()
dots+=(path)
dots+=(colours)
dots+=(prompt)
dots+=(aliases)
dots+=(functions)

directories=()
directories+=(programs)
directories+=(custom)

# `brew install coreutils` - milliseconds support in date is required. Using gnu date (gdate)
export PATH=/usr/local/opt/coreutils/libexec/gnubin:$PATH

for dot in "${dots[@]}"; do
	echo -n "$LOADING $dot"
	START=$(($(gdate +%s%N)/1000000))
	[[ -s "$HOME/dotfiles/$dot.sh" ]] && source "$HOME/dotfiles/$dot.sh"
	END=$(($(gdate +%s%N)/1000000))
	DIFF=$(echo "$END - $START" | bc)
	echo -e "\\r${CHECK_MARK} $dot \033[0;94m(${DIFF})\033[0m  "
done


for directory in "${directories[@]}"; do
	dir="$HOME/dotfiles/$directory"
	if [ -d $dir ]; then
		echo "$directory:"
		for f in $dir/*.sh; do
			base="$(basename $f .sh)"
			echo -n "$LOADING $base"
			START=$(($(date +%s%N)/1000000))
			source $f
			END=$(($(date +%s%N)/1000000))
			DIFF=$(echo "$END - $START" | bc)
			echo -e "\\r${CHECK_MARK} $base \033[0;94m(${DIFF})\033[0m  "
		done
	fi
done

cd .
