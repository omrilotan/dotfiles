import { readdir, readFile, rename } from 'node:fs/promises';
import { join } from 'node:path';
import { parseArgs } from 'node:util';
import { cameliseKeys, cli } from '../lib/index.js';

const options = {
	'help': { short: 'h', type: 'boolean' },
	'dry-run': { short: 'd', type: 'boolean' },
};

const {
  values,
  positionals
} = cli(options);

const name = positionals.join(' ');

if (values.help) {
	help();
} else {
	start(name, cameliseKeys(values))
}

async function start(name) {
	console.log(name)
}
