#!/usr/bin/env node

const exec = require('async-execute');
const { dependencies } = require('../package.json')
update(...Object.keys(dependencies));

async function update(pkg, ...packages) {
	while (pkg) {
		console.log(`Update ${pkg}`);

		await exec(
			`npm i ${pkg}@latest --no-save`,
			{ pipe: true }
		);

		pkg = packages.shift();
	}
};
