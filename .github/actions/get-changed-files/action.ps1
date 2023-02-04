Param(
	[string] $Pr
)


$HasReachedEnd = $False
$CurrentPage = 1
$AllChanges = @()

$RawAPIReponse = gh api `
		-H "Accept: application/vnd.github+json" `
		"/repos/TheCoolerServer/tcs-framework/pulls/$Pr/files"
		--paginate
$ApiResponse = ConvertFrom-Json $RawAPIReponse
$AllChanges = $ApiResponse

Write-Host ("Found {0} changes in the PR" -f $AllChanges.Count)

$ChangedFiles = $AllChanges | Where { $_.status -eq "changed" }
$AddedFiles = $AllChanges | Where { $_.status -eq "added" }
$RemovedFiles = $AllChanges | Where { $_.status -eq "removed" }
$OtherChanges = $AllChanges | Where { (($_ -NotIn $ChangedFiles) -And ($_ -NotIn $AddedFiles)) -And ($_ -NotIn $RemovedFiles) }

foreach($Change in $AllChanges) {
	Write-Host ("Found change: {0} ({1})" -f $Change.filename, $Change.status)
}

$ChangedFilesString = ($AllFiles.Foreach({ $_.filename })) -Join ","
$AddedFilesString = ($AddedFiles.Foreach({ $_.filename })) -Join ","
$RemovedFilesString = ($RemovedFiles.Foreach({ $_.filename })) -Join ","
$OtherFilesString = ($OtherChanges.Foreach({ $_.filename })) -Join ","
$AllChangesString = ($AllChanges.Foreach({ $_.filename })) -Join ","


"changed-files=$ChangedFilesString`n" | Out-File -Append -Encoding "utf8" $Env:GITHUB_OUTPUT
"added-files=$AddedFilesString`n" | Out-File -Append -Encoding "utf8" $Env:GITHUB_OUTPUT
"removed-files=$RemovedFilesString`n" | Out-File -Append -Encoding "utf8" $Env:GITHUB_OUTPUT
"other-files=$OtherFilesString`n" | Out-File -Append -Encoding "utf8" $Env:GITHUB_OUTPUT
"all-files=$AllChangesString`n" | Out-File -Append -Encoding "utf8" $Env:GITHUB_OUTPUT

Write-Host "Output file:"
Write-Host (Get-Content -Path $Env:GITHUB_OUTPUT)
