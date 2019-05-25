#!/usr/bin/env perl -w

use strict;

use Test::More;

use Bin qw($BIN);

mkdir 't-git-repo/subdirectory', 0755;

chdir 't-git-repo/subdirectory' or die $!;

my $branch_list = qx($BIN);
is $branch_list, '', 'must find database file';


done_testing;
