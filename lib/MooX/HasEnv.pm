package MooX::HasEnv;

use strict;
use warnings;
use Package::Stash;

sub import {
	my ( $class ) = @_;
	my $caller = caller;

	eval qq{
		package $caller;
		use Moo;
	};

 	my $stash = Package::Stash->new($caller);

	$stash->add_symbol('&has_env', sub {
		my ( $name, $env_var, $default ) = @_;
		my $builder = '_build_'.$name;
		$stash->add_symbol('&'.$builder, sub {
			my $env_value = $env_var && defined $ENV{$env_var} ? $ENV{$env_var} : undef;
			return defined $env_value ? $env_value : ref $default eq 'CODE' ? $default->($_[0]) : $default;
		});
		$stash->get_symbol("&has")->($name,
			is => 'ro',
			lazy_build => 1,
			builder => $builder,
		);
	});
}

1;
