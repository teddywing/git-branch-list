git-branch-list
===============

A Git add-on that allows you to maintain a list of branches to check out
quickly. Branches can be added and removed from the list, and checked out using
their ID. This makes it easier to switch between a group of active branches for
development and code review tasks by eliminating the need to remember branch
names.


## Example

	$ git branch
	  3254-make-logo-bigger
	* 3901-eliminate-CombinationService
	  4011-catalog--populate-drop-down-via-AJAX
	  master
	$ git branch-list save
	$ git branch-list
	     1	3901-eliminate-CombinationService
	$ git branch-list save 3254-make-logo-bigger
	$ git branch-list
	     1	3254-make-logo-bigger
	     2	3901-eliminate-CombinationService
	$ git checkout 4011-catalog--populate-drop-down-via-AJAX
	Switched to branch '4011-catalog--populate-drop-down-via-AJAX'
	$ git branch-list save
	$ git branch-list
	     1	4011-catalog--populate-drop-down-via-AJAX
	     2	3254-make-logo-bigger
	     3	3901-eliminate-CombinationService
	$ git branch-list 3
	Switched to branch '3901-eliminate-CombinationService'
	$ git branch-list drop 3
	$ git branch-list
	     1	4011-catalog--populate-drop-down-via-AJAX
	     2	3254-make-logo-bigger


## Install
Mac OS X users can install with Homebrew:

	$ brew install https://raw.githubusercontent.com/teddywing/git-branch-list/master/Homebrew/git-branch-list.rb

On other platforms, grab the code and put the `git-branch-list` script in your
`PATH`. Bash completion can be added by sourcing the
`git-branch-list.bash-completion` file in your Bash profile.


## License
Copyright © 2018 Teddy Wing. Licensed under the GNU GPLv3+ (see the included
COPYING file).
