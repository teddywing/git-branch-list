#!/usr/bin/env perl -w

use strict;

use Test::More;

use Bin qw($BIN);

chdir 't-git-repo' or die $!;

system('git checkout -b first-similar-name');
ok !$?;

system("$BIN save");
ok !$?;

system('git checkout -b first');
ok !$?;

system("$BIN save");
ok !$?;

system("$BIN drop");
ok !$?;

my $branch_list = qx($BIN);
is $branch_list, '     1	first-similar-name
';


# Teardown
system('git checkout master');
system('git branch -d first first-similar-name');
system("$BIN clear");


done_testing;
