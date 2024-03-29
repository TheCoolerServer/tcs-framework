Param([string[]] $ChangedFiles)

$HasChangelog = $false

foreach ($file in $ChangedFiles) {
	Write-Host "Changed file: $file";

	if ($file -match "CHANGELOG.md$") {
		$HasChangelog = $true
	}
}

if (!$HasChangelog) {
	Throw "No changelog has been written for this PR, please put what was changed in CHANGELOG.md";
}