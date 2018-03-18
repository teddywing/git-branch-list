#!/usr/bin/env perl -w

use strict;

use Test::More;

use Bin qw($BIN);

chdir 't-git-repo' or die $!;

system('git branch first');
ok !$?;

system("$BIN save first");
ok !$?;

system('git branch second');
ok !$?;

system("$BIN save second");
ok !$?;

system("$BIN clear");
ok !$?;

my $branch_list = qx($BIN);
is $branch_list, '';


# Teardown
system('git branch -d first second');


done_testing;
