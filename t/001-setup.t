#!/usr/bin/env perl -w

use strict;

use Test::More;

system('git init t-git-repo');
ok !$?;

chdir 't-git-repo' or die $!;

system('echo tmp > tmp.txt');
ok !$?;

system('git add tmp.txt');
ok !$?;

system('git commit -m "Commit"');
ok !$?;

done_testing;
