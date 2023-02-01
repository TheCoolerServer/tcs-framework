Param(
	[string] $Pr
)

$ApiResponse = ConvertFrom-Json (
	gh api `
		-H "Accept: application/vnd.github+json" `
		"/repos/TheCoolerServer/tcs-framework/pulls/$Pr/files"
)

$Files = ($ApiResponse.ForEach({ $_.filename })) -join ","

"changed-files=$Files" >> $GITHUB_OUTPUT