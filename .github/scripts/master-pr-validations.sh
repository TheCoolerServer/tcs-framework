if [ $SOURCE_BRANCH != 'dev' ] then 
	echo 'Pull requests to the master branch must only be made from the dev branch'; 
	exit 1; 
fi