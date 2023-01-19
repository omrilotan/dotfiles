import { readFile } from 'node:fs/promises';
import { fileURLToPath } from 'node:url';

export async function help(url) {
	const __dirname = fileURLToPath(new URL('.', url));
	console.log(
		(await readFile(join(__dirname, 'man'))).toString()
	);
}
