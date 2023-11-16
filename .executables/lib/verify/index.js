export function verify(desiredMajor, desiredMinor = 0) {
	const version = process.versions.node;
	const [ major, minor, ...rest ] = version.split('.');
	const message = `Run using node version ${desiredMajor}.${desiredMinor} or higher. (now running ${version}).`;

	if (Number(major) < desiredMajor) {
		Error.stackTraceLimit = 1;
		throw new Error(message);
	}

	if (Number(major) === desiredMajor && Number(minor) < desiredMinor) {
		Error.stackTraceLimit = 1;
		throw new Error(message);
	}
}
