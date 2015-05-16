#!/usr/pkg/bin/perl

use warnings;
use strict;

use Test::BDD::Cucumber::StepFile;
use Test::More;

Given qr/^the comma-separated address (.+)$/, sub {
	S->{input_address} = $1;
};

When qr/^it is formatted for display$/, sub {
	S->{formatted_address} = format_address(
		extract_address_parts(S->{input_address})
	);
};

Then qr/^it looks like$/, sub {
	is(S->{formatted_address}, C->data);
};

sub extract_address_parts {
	my ($input_address) = @_;
	return split(/,/, $input_address);
}

sub format_address {
	my ($last, $first, $title, $street) = @_;
	return <<EOT;
$title $first $last
$street
EOT
}
