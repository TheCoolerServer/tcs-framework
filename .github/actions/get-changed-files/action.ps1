Param(
	[string] $Pr
)

$RawAPIReponse = gh api `
	-H "Accept: application/vnd.github+json" `
	"/repos/TheCoolerServer/tcs-framework/pulls/$Pr/files?per_page=100"
$ApiResponse = ConvertFrom-Json $RawAPIReponse

$FileNames = $ApiResponse.ForEach({ $_.filename })

Write-Output ("Found changed files:" -f ($FileNames -join "`n"))

$CommaSeparatedFiles = $FileNames -join ","

"changed-files=$CommaSeparatedFiles" >> $GITHUB_OUTPUT