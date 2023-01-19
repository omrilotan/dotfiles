import { parseArgs } from 'node:util';

const [ prog, executable, ...args ] = process.argv;

export function cli(options) {
	const {
		values,
		positionals
	} = parseArgs({ args, options, allowPositionals: true, strict: false });

	return { values, positionals };
}
