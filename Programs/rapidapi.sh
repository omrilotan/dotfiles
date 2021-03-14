function define {
	echo "Define $1"

	curl --request GET \
		--url "https://wordsapiv1.p.rapidapi.com/words/${1}" \
		--header 'x-rapidapi-host: wordsapiv1.p.rapidapi.com' \
		--header 'x-rapidapi-key: $RAPIDAPI_KEY' \
		| jq '.word.results'
}
