#!/usr/bin/env node

const { promises: { writeFile } } = require('fs');
const { join } = require('path');
const pkg = require('../package.json')
latest(pkg);

async function latest(pkg) {
	pkg.dependencies = Object.fromEntries(
		Object.keys(
			pkg.dependencies
		).map(
			key => [key, 'latest']
		)
	);

	await writeFile(
		join(__dirname, '..', 'package.json'),
		JSON.stringify(pkg, null, 2) + '\n'
	)
}
