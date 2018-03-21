#!/usr/bin/env perl -w

use strict;

use Test::More;

use Bin qw($BIN);

chdir 't-git-repo' or die $!;

system('git checkout -b first');
ok !$?;

system("$BIN save");
ok !$?;

system("$BIN drop");
ok !$?;

my $branch_list = qx($BIN);
is $branch_list, '';


# Teardown
system('git checkout master');
system('git branch -d first');


done_testing;
