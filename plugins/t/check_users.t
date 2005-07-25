#! /usr/bin/perl -w -I ..
#
# Logged in Users Tests via check_users
#
# $Id$
#

use strict;
use Test;
use NPTest;

use vars qw($tests);
BEGIN {$tests = 4; plan tests => $tests}

my $successOutput = '/^USERS OK - [0-9]+ users currently logged in/';
my $failureOutput = '/^USERS CRITICAL - [0-9]+ users currently logged in/';

my $t;

$t += checkCmd( "./check_users 1000 1000", 0, $successOutput );
$t += checkCmd( "./check_users    0    0", 2, $failureOutput );

exit(0) if defined($Test::Harness::VERSION);
exit($tests - $t);

