LOADING="⏳"
CHECK_MARK="\033[0;32m\xE2\x9C\x94\033[0m"
POST_INIT="pudding"

# reset path
export PATH=""
export PATH="$PATH:/usr/local/"
export PATH="$PATH:/usr/local/bin"
export PATH="$PATH:/usr/local/sbin"
export PATH="$PATH:/opt/local/bin/"
export PATH="$PATH:/opt/local/sbin"
export PATH="$PATH:/bin"
export PATH="$PATH:/sbin"
export PATH="$PATH:/usr/bin"
export PATH="$PATH:/usr/sbin"
export PATH="$PATH:/opt/X11/bin"

directories=($(ls -d ~/dotfiles/*/ | grep -v node_modules))

# `brew install coreutils` - milliseconds support in date is required. Using gnu date (gdate)
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"

if [ ! -f "/usr/local/opt/coreutils/libexec/gnubin/date" ]; then
	echo "Requires gnu date to work"
fi

STARTALL=$(date +%s)

for directory in "${directories[@]}"; do
	echo -e "\033[0;33m${directory##*dotfiles/}\033[0m"
	for f in ${directory}*.sh; do
		base="$(basename $f .sh)"
		echo -n "$LOADING $base"
		START=$(($(date +%s%N)/1000000))
		source $f
		END=$(($(date +%s%N)/1000000))
		DIFF=$(echo "$END - $START" | bc)
		echo -e "\\r${CHECK_MARK} $base \033[0;94m(${DIFF})\033[0m  "
	done
done

echo -e "\033[0;33m🍮  ${POST_INIT}\033[0m"
echo -n "$LOADING $POST_INIT"
START=$(($(date +%s%N)/1000000))
source ~/dotfiles/${POST_INIT}.sh
END=$(($(date +%s%N)/1000000))
DIFF=$(echo "$END - $START" | bc)
echo -e "\\r${CHECK_MARK} ${POST_INIT} \033[0;94m(${DIFF})\033[0m  "

ENDALL=$(date +%s)
DIFFALL=$(echo "($ENDALL - $STARTALL)" | bc)
echo -e "\033[0;94mEverything took ${DIFFALL} seconds\033[0m"

cd .
name
