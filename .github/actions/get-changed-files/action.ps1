Param(
	[string] $Pr
)

$RawAPIReponse = gh api `
	-H "Accept: application/vnd.github+json" `
	"/repos/TheCoolerServer/tcs-framework/pulls/$Pr/files?per_page=100"
$ApiResponse = ConvertFrom-Json $RawAPIReponse

Write-Output "API response: $ApiResponse"

$FileNames = $ApiResponse.ForEach({ $_.filename })

Write-Output "File names: $FileNames"

Write-Output ("Found changed files: {0}" -f ($FileNames -join "`n"))

$CommaSeparatedFiles = $FileNames -join ","

Write-Output "Writing output: $CommaSeparatedFiles"

"changed-files=$CommaSeparatedFiles" >> $GITHUB_OUTPUT