#!/usr/bin/env perl -w

use strict;

use Test::More;

use Bin qw($BIN);

chdir 't-git-repo' or die $!;

system('git branch one');
ok !$?;

system("$BIN save one");
ok !$?;

system('git branch two');
ok !$?;

system("$BIN save two");
ok !$?;

system('git branch three');
ok !$?;

system("$BIN save three");
ok !$?;

system('git branch four');
ok !$?;

system("$BIN save four");
ok !$?;

system('git branch five');
ok !$?;

system("$BIN save five");
ok !$?;

system('git branch six');
ok !$?;

system("$BIN save six");
ok !$?;

system('git branch seven');
ok !$?;

system("$BIN save seven");
ok !$?;

system('git branch eight');
ok !$?;

system("$BIN save eight");
ok !$?;

system('git branch nine');
ok !$?;

system("$BIN save nine");
ok !$?;

system('git branch ten');
ok !$?;

system("$BIN save ten");
ok !$?;

system('git branch eleven');
ok !$?;

system("$BIN save eleven");
ok !$?;


system("$BIN 1");
ok !$?;

my $current_branch = qx(git rev-parse --abbrev-ref HEAD);
is $current_branch, 'eleven
';


system("$BIN 11");
ok !$?;

$current_branch = qx(git rev-parse --abbrev-ref HEAD);
is $current_branch, 'one
';


# Teardown
system('git checkout master');
system("$BIN clear");
system('git branch -d one two three four five six seven eight nine ten eleven');


done_testing;
