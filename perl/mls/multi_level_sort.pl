#!/usr/bin/perl

use strict;
use Data::Dumper;
use lib '/Library/Perl/5.12';
use URI                  qw( );
use Domain::PublicSuffix qw( );

open(FR, './random_domain_names.txt');
open(FW, '>./sorted_output.txt');
my $rand_domains = [];
while (<FR>) { chomp; push @$rand_domains, $_; }
close FR;

my $dps = Domain::PublicSuffix->new();

my $tld_grp = {};
foreach my $url (@$rand_domains) {
    my $host = URI->new('http://'.$url)->host();
    $dps->get_root_domain($host);
    my $tld = $dps->suffix();
    $tld_grp->{$tld} = {} if not exists $tld_grp->{$tld};
    $tld_grp->{$tld}->{$url} = 1;
}

foreach my $tld (sort keys %$tld_grp) {
    foreach my $url (sort keys %{$tld_grp->{$tld}}) {
        print FW "$url\n";
    }
}
close FW;
