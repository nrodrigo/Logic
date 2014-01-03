#!/usr/bin/perl

use strict;
use Data::Dumper;

package Node;

sub new {
	my $class = shift;
	my $self = {
		value => shift,
		children => []
		};
	bless $self, $class;
}

sub get_value {
	my $self = shift;
	return $self->{value}." ";
}

sub get_children {
	my $self = shift;
	return @{$self->{children}};
}

sub add_child {
	my $self = shift;
	push @{$self->{children}}, shift;
}

1;

package main;

print <<__TREE__;
Tree:
            a
          /   \\
        b       c
      / | \\    / \\
    d   e  f  g   h
   / \\       /   / \\
  i   j     k   l   m

__TREE__

my $node = {};
for (my $i = 97; $i <= 109; $i++) {
	$node->{chr($i)} = new Node(chr($i));
}

# build tree
$node->{a}->add_child($node->{b});
$node->{a}->add_child($node->{c});
$node->{b}->add_child($node->{d});
$node->{b}->add_child($node->{e});
$node->{b}->add_child($node->{f});
$node->{c}->add_child($node->{g});
$node->{c}->add_child($node->{h});
$node->{d}->add_child($node->{i});
$node->{d}->add_child($node->{j});
$node->{g}->add_child($node->{k});
$node->{h}->add_child($node->{l});
$node->{h}->add_child($node->{m});

print "DFS:\n";
dfs($node->{a});

print "\n\nBFS:\n";
bfs($node->{a});

print "\n\n";

sub dfs {
	my $node = shift;
	print $node->get_value;
	foreach my $child ($node->get_children) {
		dfs($child);
	}
}

sub bfs {
	# enqueue = push
	# dequeue = shift
	my $root = shift;
	my $list = [ $root ];
	while (my $node = shift @$list) {
		print $node->get_value;
		foreach my $child ($node->get_children) {
			push @$list, $child;
		}
	}
}



