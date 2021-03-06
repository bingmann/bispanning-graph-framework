#!/usr/bin/perl -w
################################################################################
# src/graphstring2tikz.pl
#
################################################################################

use strict;
use warnings;

my $ln = <>;
chomp($ln);

$ln =~ s/V[0-9]+:(.+)$/$1/;

while ($ln =~ s!i([0-9]+)x([0-9]+)y([0-9]+)/!!)
{
    print "    \\node [odot] (n$1) at ($2,$3) {$1};\n";
}
print "\n";

$ln =~ s/E[0-9]+:(.+)$/$1/;

while ($ln =~ s!i([0-9]+)t([0-9]+)h([0-9]+)c([0-9]+)/!!)
{
    print "    \\draw [".($4 == "1" ? "B" : "R"). "] (n$2) -- (n$3);\n";
}

################################################################################
