Param(
	[string] $Pr
)

$ApiResponse = ConvertFrom-Json (
	gh api `
		-H "Accept: application/vnd.github+json" `
		"/repos/TheCoolerServer/tcs-framework/pulls/$Pr/files"
)

$FileNames = $ApiResponse.ForEach({ $_.filename })

Write-Output ("Foud changed files:" -f ($FileNames -join "`n"))

$CommaSeparatedFiles = $FileNames -join ","

"changed-files=$CommaSeparatedFiles" >> $GITHUB_OUTPUT