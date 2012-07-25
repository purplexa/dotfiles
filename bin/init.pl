#!/usr/bin/env perl

use strict;
use warnings;

use YAML::Tiny;
use Data::Dumper;

# Fix this to guess, prompt, or get from parameter.
my $schema_path = 'conf/schema.yml';

# Open $schema_path
my $conf = YAML::Tiny->new;
$conf = YAML::Tiny->read( $schema_path )->[0];

my $files_path = $conf->{ info }->{ base_dir };

print Dumper $conf;
