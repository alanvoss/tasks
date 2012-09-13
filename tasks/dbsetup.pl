use strict;
use warnings;

use Schema;
use Data::Dumper;

my $schema = Schema->connect("dbi:mysql:dbname=task","tasks","glasshouses1!");
print $schema->deployment_statements();


exit;

my $new_user = $schema->resultset('User')->new({
   user => 'avoss',
   secretkey => 'diqwerkljasg',
});

$new_user->insert;

my @all_artists = $schema->resultset('User')->all;
print "got here\n";
print Dumper \@all_artists;
