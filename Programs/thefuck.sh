function fuck {
	eval "$(thefuck --alias)"
	eval "fuck $@"
}
