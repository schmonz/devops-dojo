#!/usr/pkg/bin/perl

use warnings;
use strict;

use Test::BDD::Cucumber::StepFile;
use Test::More;

require 'printlabels';

Given qr/^the comma-separated address.*$/, sub {
	S->{input_addresses} = [ printlabels::one_address_per_line(C->data) ];
};

Given qr/^the CSV file (.+)$/, sub {
	my $filename = $1;
	my $contents;
	{
		local $/ = undef;
		open FILE, $filename or die "Couldn't open file: $!";
		binmode FILE;
		$contents = <FILE>;
		close FILE;
	}

	S->{input_addresses} = [ printlabels::one_address_per_line($contents) ];
};

When qr/^.+ formatted for display$/, sub {
	S->{formatted_output} = join(
		"\n",
		map { printlabels::format_address(printlabels::extract_address_parts($_)) }
			@{S->{input_addresses}},
	);
};

Then qr/^it should look like$/, sub {
	is(S->{formatted_output}, C->data);
};

Then qr/^this line is a dummy so Cucumber can parse this feature$/, sub {};
