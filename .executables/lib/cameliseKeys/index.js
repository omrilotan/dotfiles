import { camelise } from "../camelise/index.js";

export const cameliseKeys = object => Object.fromEntries(
	Object.entries(object).map(
		([ key, value ]) => [ camelise(key), value ]
	)
)
