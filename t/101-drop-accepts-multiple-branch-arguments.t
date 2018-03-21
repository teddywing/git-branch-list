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

system('git branch third');
ok !$?;

system("$BIN save third");
ok !$?;

system("$BIN drop 1 3");
ok !$?;

my $branch_list = qx($BIN);
is $branch_list, '
     1	second
';


# Teardown
system('git branch -d first second third');
system("$BIN clear");


done_testing;
