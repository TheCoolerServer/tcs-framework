$HasChangelog = $false

foreach ($file in $Env:CHANGED_FILES) {
	if ($file -eq "CHANGELOG.md") {
		$HasChangelog = $true
	}
}

if (!$HasChangelog) {
	Throw "No changelog has been written for this PR, please put what was changed in CHANGELOG.md";
}