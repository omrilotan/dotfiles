#!/usr/bin/env node

import { readdir, readFile, rename, stat } from 'node:fs/promises';
import { dirname, join } from 'node:path';
import { cli, lowerCase, cameliseKeys } from '../lib/index.js';

const wait = ms => new Promise(resolve => setTimeout(resolve, ms));

const options = {
	'help': { short: 'h', type: 'boolean', multiple: false },
	'dry-run': { short: 'd', type: 'boolean', multiple: false },
	'filter': { short: 'f', type: 'string', multiple: false },
	'prefix': { short: 'p', type: 'boolean', multiple: false },
	'extension': { short: 'e', type: 'string', multiple: false },
	'ext': { type: 'string', multiple: false },
	'quiet': { short: 'q', type: 'boolean', multiple: false },
	'start-from': { short: 's', type: 'string', multiple: false },
	'force': { short: 'f', type: 'boolean', multiple: false },
};

const {
  values,
  positionals
} = cli(options);

const name = positionals.map(lowerCase).join('-');
start(name, cameliseKeys(values))

async function start(
	name,
	{
		dryRun = false,
		extension,
		filter,
		force = false,
		help,
		prefix = false,
		quiet = false,
		startFrom = '1',
}
) {
	if (help) {

		const { pathname: manfile } = new URL(join(dirname(import.meta.url), 'man'));
		process.stdout.write((await readFile(manfile)).toString());
		return;
	}
	const base = process.cwd();
	const files = await readdir(base)
	const pattern = filter ? new RegExp(filter) : /^[^\.].*/
	const { length } = (files.length + 1).toString();
	const digitise = num => num.toString().padStart(length, '0')
	let list = files.filter(filename => pattern.test(filename)) // .sort()
	let index = Number(startFrom) - 1

	// // Sort files by date
	// list = await Promise.all(list.map(async filename => {
	// 	const { ctime } = await stat(join(base, filename))
	// 	return { filename, ctime }
	// }))
	// list = list.sort((a, b) => a.ctime - b.ctime).map(({ filename }) => filename)

	const filesAreEnumerated = new Set(list.map((filename) => filename.replace(/[-_\s](\d+)\.(jpg|jpeg|png)$/, ""))).size === 1;
	const filesAreNumbers = list.every(filename => filename.match(/^\d+\.(jpg|jpeg|png)$/));
	const filesArePrefixEnumerated = list.every(filename => filename.match(/^\d+[_-]/));

	for (const filename of list) {
		const ext = extension || (filename.includes(".") ? filename.split(".").pop() : undefined);
		let newName = name + filename;

		const conposeFilename = (filename, ext) => [
			[prefix ? name : "", filename, prefix ? "" : name].join(''),
			ext
		].filter(Boolean).join('.');

		if (force) {
			newName = conposeFilename(digitise(++index), ext);
		} else if (filesAreNumbers) {
			const [ strippedName ] = filename.split('.');
			newName = conposeFilenamedigitise(strippedName, ext);
		} else if (filesAreEnumerated) {
			newName = filename.match(
				/[-_\s](\d+)\.(?:jpg|jpeg|png)$/,
				// new RegExp(`[-_\s](\\d+)\\.${ext}$`),
					// /(?:.*)[-_](\d+)\.(?:jpg|jpeg|png)$/,
			)[1];
			newName = conposeFilename(digitise(newName), ext);
		} else if (filesArePrefixEnumerated) {
			const number = filename.match(/^\d+/)[0];
			// strips filename.replace(/^\d+/, '')
			newName = conposeFilenamedigitise(digitise(number), ext);
		} else {
			newName = conposeFilenamedigitise(digitise(++index), ext);
		}

		if (await readFile(newName).catch(e => false)) {
			console.log(`File already exists: "${newName}". Abort operation.`);
			// process.exit(1);
		} else {
			quiet || console.log([ filename, '→', newName ].join(' '))
			dryRun || await rename(join(base, filename), join(base, newName));
		}
		// await wait(1000)
	}
}
