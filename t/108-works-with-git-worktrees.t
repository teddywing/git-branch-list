#!/usr/bin/env perl -w

use strict;

use Test::More;
use File::Path qw(remove_tree);

use Bin qw($BIN);

chdir 't-git-repo' or die $!;

system('git branch a-branch');
ok !$?;

system("$BIN save a-branch");
ok !$?;

system('git worktree add ../t-git-repo-worktree');
ok !$?;

chdir '../t-git-repo-worktree' or die $!;

my $branch_list = qx($BIN);
is $branch_list, '     1	a-branch
';


# Teardown
system("$BIN clear");
chdir '../t-git-repo' or die $!;
remove_tree('../t-git-repo-worktree') or die $!;
system('git checkout master');
system('git branch -d a-branch');


done_testing;
