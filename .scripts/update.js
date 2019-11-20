#!/usr/bin/env node

const exec = require('async-execute');
const { dependencies } = require('../package.json')
update(...Object.keys(dependencies));

async function update(...packages) {
	const list = packages.map(
		pkg => [pkg, 'latest'].join('@')
	).join(' ');

	console.log(`Update ${packages.join(', ')}`);
	await exec(
		`npm i ${list} --no-save`,
		{ pipe: true }
	);
};
