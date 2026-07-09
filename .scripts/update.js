#!/usr/bin/env node

/**
 * npm run update
 * npm run update -- npm snyk other
 */

import { execute } from "async-execute";
import pkg from "../package.json" with { type: "json" };

const { dependencies } = pkg;

(function () {
	const {
		argv: [, , ...args],
	} = process;
	const installed = Object.keys(dependencies);

	const packages = args.length ? intersect(args, installed) : installed;
	update(...packages);
})();

async function update(...packages) {
	const list = packages.map((pkg) => [pkg, "latest"].join("@")).join(" ");

	console.log(`Update ${packages.join(", ")}`);
	await execute(`npm i ${list} --no-save`, { pipe: true });
}

function intersect(...arrays) {
	let result = arrays.shift();

	while (arrays.length) {
		result = result.filter([].includes.bind(arrays.shift()));
	}

	return result;
}
