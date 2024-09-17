import fs from 'node:fs/promises';
import path from 'path';

const directoryPath = process.cwd();

const files = await fs.readdir(directoryPath);
for (const file of files) {
		const oldPath = path.join(directoryPath, file);
		const newPath = path.join(directoryPath, file.replace(/\s+/g, '-').toLowerCase());
		await fs.rename(oldPath, newPath);
		console.log(`Renamed: ${file} -> ${newPath}`);
}
