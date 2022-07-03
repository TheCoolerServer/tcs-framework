const fs = require("fs");
const readline = require("readline");
const os = require("os");

async function main() {
	const inputStream = fs.createReadStream("CHANGELOG.md");
	const outputStream = fs.createWriteStream("releaseBody.md");

	try {
		const rl = readline.createInterface({
			input: inputStream,
			crlfDelay: Infinity,
		});

		let currentReleaseHeader = 0;

		for await (const line of rl) {
			const parts = line.split(" ");

			if (parts[0] == "##") {
				currentReleaseHeader++;
			}

			if (currentReleaseHeader === 2) {
				outputStream.write(line + "\n");
			}
		}
	} catch (error) {
		process.exitCode = 1;
		process.stderr.write(error.message);
	} finally {
		inputStream.close();
		outputStream.close();
	}
}

main();
