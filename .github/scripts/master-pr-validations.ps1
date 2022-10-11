
if (!$Env:SOURCE_BRANCH -eq "dev" ) { 
	Throw "Pull requests to the master branch must only be made from the dev branch";
}