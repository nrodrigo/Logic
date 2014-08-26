#!/usr/bin/perl

use strict;
use Data::Dumper;

my @list = (-1, 3, 5, 0, 2, -8, 1, 6);
print max_subarray(\@list);
print "\n";

sub max_subarray {
    my $list = shift;
    my ($max_ending_here, $max_so_far) = (0, 0);
    foreach my $x (@$list) {
        $max_ending_here = max(0, $max_ending_here + $x);
        $max_so_far = max($max_so_far, $max_ending_here);
    }
    return $max_so_far;
}

sub max {
    my ($a, $b) = @_;
    return $a > $b ? $a : $b;
}
