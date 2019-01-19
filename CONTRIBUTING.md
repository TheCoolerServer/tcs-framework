# Contributing to the framework
First off, thanks for taking the time to contribute!

The following is a set of guidelines and rules for contributing to the TCS mission framework. If you see the need to change one or more guidelines or rules feel free to propose changes to this document in a pull request.


## Rules
* Code blocks must be indented by 2 spaces, not 4  
* Variable names must be descriptive and try not to shorten variable names too much  

For example:  
Bad
```sqf
private _g = createGroup [east, true];
[player] joinSilent _g;
```
Good
```sqf
private _group = createGroup [east, true];
[player] joinSilent _group;
```

## Guidelines
### You found a bug or an error in the framework
Please create a new issue explaining in detail exactly what happens and which steps are necessary to reproduce the error or bug.
If there are any in-game error messages or script error messages please also add a screenshot of those.
If you can, also attach the zipped mission folder.

### Merge requests
Pull requests must not contain any syntax errors and should be tested before the merge-request being made.
If there are any syntax errors or any merge conflicts the merge request will not be accepted, please fix those before submitting one.
Nobody is perfect, but try to make sure your changes work as expected before submitting a merge-request.

### Procedure for merge requests
To make a merge request please take these steps:
* Fork the repository if you haven't already.
* Update your local `dev` branch to the latest version.
* Fork your `dev` branch and make your changes.
* Submit a merge request to the main repository.

If your merge request isn't accepted please fix the issues that will be pointed out by the maintainers of the main repository.