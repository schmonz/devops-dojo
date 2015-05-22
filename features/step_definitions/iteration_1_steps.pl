#!/usr/pkg/bin/perl

use warnings;
use strict;

use Test::BDD::Cucumber::StepFile;
use Test::More;

Given qr/^the comma-separated address.*$/, sub {
	S->{input_addresses} = [ one_address_per_line(C->data) ];
};

When qr/^.+ formatted for display$/, sub {
	S->{formatted_output} = join(
		"\n",
		map { format_address(extract_address_parts($_)) }
			@{S->{input_addresses}},
	);
};

Then qr/^it should look like$/, sub {
	is(S->{formatted_output}, C->data);
};

Then qr/^this line is a dummy so Cucumber can parse this feature$/, sub {};

sub one_address_per_line {
	my ($as_one_big_string) = @_;
	return sort split("\n", $as_one_big_string);
}

sub extract_address_parts {
	my ($input_address) = @_;
	chomp($input_address);
	return split(/,/, $input_address);
}

sub format_address {
	my ($last, $first, $title, $street) = @_;
	return <<EOT;
$title $first $last
$street
EOT
}
