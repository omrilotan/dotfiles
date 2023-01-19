export const camelise = string => string.toLowerCase().replace(
	/[^a-zA-Z0-9]+(.)/g,
	(match, character) => character.toUpperCase()
)
