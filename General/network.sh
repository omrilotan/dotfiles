alias ports='lsof -i -P | grep -i listen'
alias ip='ipconfig getifaddr en0'
alias flushcache='sudo dscacheutil -flushcache'
alias dnscacheflush='sudo dscacheutil -flushcache'
alias hosts='edit /etc/hosts'
function headers {
	curl $1 -svo /dev/null 2>&1 | grep ^\<
}
function google {
	'open "https://www.google.com/?q=$*"'
}

function youtube {
	open "https://www.youtube.com/results?search_query=$*"
}
