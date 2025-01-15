#!/usr/bin/env node

import { readdir, readFile, rename, stat } from "node:fs/promises";
import { dirname, join } from "node:path";
import { cli, lowerCase, cameliseKeys } from "../lib/index.js";

const wait = ms => new Promise(resolve => setTimeout(resolve, ms));

const options = {
	"help": { short: "h", type: "boolean", multiple: false, description: "Print help" },
	"dry-run": { short: "d", type: "boolean", multiple: false, description: "Do not rename files, just print what would be done" },
	"analyze": { short: "a", type: "boolean", multiple: false, description: "Analyze files and print the type of handling" },
	"filter": { short: "f", type: "string", multiple: false, description: "Filter files by a regular expression" },
	"prefix": { short: "p", type: "boolean", multiple: false, description: "Use string as prefix instead of suffix" },
	"extension": { short: "e", type: "string", multiple: false, description: "Use a specific extension" },
	"quiet": { short: "q", type: "boolean", multiple: false, description: "Do not print anything" },
	"start-from": { short: "s", type: "string", multiple: false, description: "Start numbering from a specific number" },
	"force": { short: "f", type: "boolean", multiple: false, description: "No matter the pattern you recognised, use basic algorithm" },
};

function formatOptions(options) {
  return Object.entries(options).map(([long, { short, description }]) => {
    const shortOption = short ? `-${short}` : "   ";
    return `--${long.padEnd(12)} ${shortOption.padEnd(5)} :    ${description}`;
  }).join("\n");
}

const {
  values,
  positionals
} = await (async() => {
	try {
		return cli(options);
	} catch (error) {
		console.error(error.message);
		await start("", { help: true });
		process.exit(1);
	}
})()

const name = positionals.map(lowerCase).join("-");
start(name, cameliseKeys(values))

async function start(
	name,
	{
		dryRun = false,
		analyze = false,
		extension,
		filter,
		force = false,
		help,
		prefix = false,
		quiet = false,
		startFrom = "1",
}
) {
	if (help) {
		const { pathname: manfile } = new URL(join(dirname(import.meta.url), "man"));
		const manual = await readFile(manfile, "utf8");
		const output = [ ...manual.split("\n").filter(line => !line.includes("--help")).filter(Boolean), "", formatOptions(options), "" ].join("\n");
		process.stdout.write(output);
		return;
	}
	const base = process.cwd();
	const files = await readdir(base)
	const pattern = filter ? new RegExp(filter) : /^[^\.].*/
	const { length } = (files.length + 1).toString();
	const digitise = num => num.toString().padStart(length, "0")
	let list = files.filter(filename => pattern.test(filename)) // .sort()
	let index = Number(startFrom) - 1

	// // Sort files by date
	// list = await Promise.all(list.map(async filename => {
	// 	const { ctime } = await stat(join(base, filename))
	// 	return { filename, ctime }
	// }))
	// list = list.sort((a, b) => a.ctime - b.ctime).map(({ filename }) => filename)

	const filesAreEnumerated = new Set(list.map((filename) => filename.replace(/[-_\s](\d+)\.(jpg|jpeg|png|gif|webp)$/, ""))).size === 1;
	const filesAreNumbersWithSuffix = list.every(filename => filename.match(/(\d+)[-_\s](?:\d+)\.(?:jpg|jpeg|png|gif|webp)$/));
	const filesAreNumbers = list.every(filename => filename.match(/^\d+\.(?:jpg|jpeg|png|gif|webp)$/));
	let filesArePrefixEnumerated = list.every(filename => filename.match(/^\d+[_-]/));

	if (filesAreNumbersWithSuffix) {
		list = list.sort((a, b) => {
			const aNumber = a.match(/(\d+)[-_\s](?:\d+)\.(?:jpg|jpeg|png|gif|webp)$/)[1];
			const bNumber = b.match(/(\d+)[-_\s](?:\d+)\.(?:jpg|jpeg|png|gif|webp)$/)[1];
			return Number(aNumber) - Number(bNumber);
		});
		filesArePrefixEnumerated = false;
	}

	if (analyze) {
		console.info(
			Object.entries({
				filesAreEnumerated,
				filesAreNumbersWithSuffix,
				filesAreNumbers,
				filesArePrefixEnumerated
			}).map(
				([key, value]) => [value ? "✔︎" : "×", key].join(" ")
			).join("\n")
		);
		return;
	}

	for (const filename of list) {
		const ext = extension || (filename.includes(".") ? filename.split(".").pop() : undefined);
		let newName = name + filename;

		const composeFilename = (filename, ext) => [
			[prefix ? name : "", filename, prefix ? "" : name].join(""),
			ext
		].filter(Boolean).join(".");

		if (force) {
			newName = composeFilename(digitise(++index), ext);
		} else if (filesAreNumbers) {
			const [ strippedName ] = filename.split(".");
			newName = composeFilename(digitise(strippedName), ext);
		} else if (filesAreEnumerated) {
			newName = filename.match(
				/[-_\s](\d+)\.(?:jpg|jpeg|png|gif|webp)$/,
				// new RegExp(`[-_\s](\\d+)\\.${ext}$`),
					// /(?:.*)[-_](\d+)\.(?:jpg|jpeg|png|gif|webp)$/,
			)[1];
			newName = composeFilename(digitise(newName), ext);
		} else if (filesArePrefixEnumerated) {
			const number = filename.match(/^\d+/)[0];
			// strips filename.replace(/^\d+/, "")
			newName = composeFilename(digitise(number), ext);
		} else if (filesAreNumbersWithSuffix) {
			const number = filename.match(/(\d+)[-_\s](?:\d+)\.(?:jpg|jpeg|png|gif|webp)$/)[1];
			newName = composeFilename(digitise(number), ext);
		} else {
			newName = composeFilename(digitise(++index), ext);
		}

		if (await readFile(newName).catch(e => false)) {
			console.log(`File already exists: "${newName}". Abort operation.`);
			// process.exit(1);
		} else {
			quiet || console.log([ filename, "→", newName ].join(" "))
			dryRun || await rename(join(base, filename), join(base, newName));
		}
		// await wait(1000)
	}
}
