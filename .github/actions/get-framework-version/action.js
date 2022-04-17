const core = require("@actions/core");
const fs = require("fs");
const readline = require("readline");

async function main() {
	try {
		let major = "";
		let minor = "";
		let patch = "";

		const filePath = "tcs/base/FrameworkVersion.hpp";
		const inputStream = fs.createReadStream(filePath);

		const rl = readline.createInterface({
			input: inputStream,
			crlfDelay: Infinity,
		});

		for await (const line of rl) {
			const parts = line.split(" ");

			if (parts.length === 3 && parts[0] === "#define") {
				switch (parts[1]) {
					case "VERSION_MAJOR":
						major = parts[2];
						break;

					case "VERSION_MINOR":
						minor = parts[2];
						break;

					case "VERSION_PATCH":
						patch = parts[2];
						break;

					default:
						break;
				}
			}
		}

		core.setOutput("version", `${major}.${minor}.${patch}`);
	} catch (error) {
		core.setFailed(error.message);
	}
}

main();
