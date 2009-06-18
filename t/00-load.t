#!perl -T

use Test::More tests => 1;

BEGIN {
	use_ok( 'Net::Delicious::RSS' );
}

diag( "Testing Net::Delicious::RSS $Net::Delicious::RSS::VERSION, Perl $], $^X" );
