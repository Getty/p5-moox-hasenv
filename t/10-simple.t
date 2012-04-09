#!/usr/bin/env perl

use strict;
use warnings;
use Test::More;

use FindBin qw($Bin);
use lib "$Bin/lib";

use MooXTestBla;

$ENV{MOOX_HAS_ENV_TEST_BLAOVER} = 'OVERRIDDEN';

my $test = MooXTestBla->new( over => 'blablub' );

isa_ok($test,'MooXTestBla');
is($test->bla,'blub','Testing bla value');
is($test->blaover,'OVERRIDDEN','Testing blaover value');
is($test->blabla,'blubblub','Testing blabla value');
is($test->over,'blablub','Testing over value');

done_testing;
