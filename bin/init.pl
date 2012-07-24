#!/usr/bin/env perl

use YAML::Tiny;
use Data::Dumper;

# Open $files_path/conf/schema.yml
$conf = YAML::Tiny->new;
$conf = YAML::Tiny->read( $files_path . '/conf/schema.yml' );

$files_path = $conf->[0]->{ 'info' }->{ 'base_dir' };
