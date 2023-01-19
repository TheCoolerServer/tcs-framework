Param(
	[string] $SourceBranch, 
	[string[]] $ChangedFiles
)

if (!$SourceBranch -eq "dev" ) { 
	Throw "Pull requests to the master branch must only be made from the dev branch";
}

$HasChangedFrameworkVersion = $false

foreach ($file in $ChangedFiles) {
	if ($file -match "FrameworkVersion\.hpp$") {
		$HasChangedFrameworkVersion = $true;
	}
}


if (!$HasChangedFrameworkVersion) {
	Throw "PRs to the master branch must change the framework version because a new release will be created";
}