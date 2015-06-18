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
	my $contents = printlabels::read_file_into_one_big_string($filename);

	S->{input_addresses} = [printlabels::one_address_per_line($contents)];
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
