#!/usr/bin/perl

use warnings;
use strict;
use diagnostics;

my %RNA_to_aa= (
        "AAA" => "K", "AAC" => "N", "AAG" => "K", "AAU" => "N",
        "ACA" => "T", "ACC" => "T", "ACG" => "T", "ACU" => "T",
        "AGA" => "R", "AGC" => "S", "AGG" => "R", "AGU" => "S",
        "AUA" => "I", "AUC" => "I", "AUG" => "M", "AUU" => "I",
        "CAA" => "Q", "CAC" => "H", "CAG" => "Q", "CAU" => "H",
        "CCA" => "P", "CCC" => "P", "CCG" => "P", "CCU" => "P",
        "CGA" => "R", "CGC" => "R", "CGG" => "R", "CGU" => "R",
        "CUA" => "L", "CUC" => "L", "CUG" => "L", "CUU" => "L",
        "GAA" => "E", "GAC" => "D", "GAG" => "E", "GAU" => "D",
        "GCA" => "A", "GCC" => "A", "GCG" => "A", "GCU" => "A",
        "GGA" => "G", "GGC" => "G", "GGG" => "G", "GGU" => "G",
        "GUA" => "V", "GUC" => "V", "GUG" => "V", "GUU" => "V",
        "UAA" => "*", "UAC" => "Y", "UAG" => "*", "UAU" => "Y",
        "UCA" => "S", "UCC" => "S", "UCG" => "S", "UCU" => "S",
        "UGA" => "*", "UGC" => "C", "UGG" => "W", "UGU" => "C",
        "UUA" => "L", "UUC" => "F", "UUG" => "L", "UUU" => "F" );

my($header, %seqs, @seqnames);

print "which file would you like to open?\n"; 

my ($fastafile ) = <STDIN>;

open ( my $fh , '<:encoding(UTF-8)', $fastafile ) or die "\nFailed to open file $fastafile, $!\n";

my @codon = ();
my $sequence;

while (my $line = <$fh>) {
        chomp $line;
        $line =~ s/T/U/g;
        my @sequence = ( $line =~ m/.{3}/g );
        push (@codon, @sequence);
}

foreach (@codon) {
        print "$_\n";
} 

